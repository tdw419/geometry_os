; DESCRIPTION: Creates a magenta rectangular region at (210, 32) spanning 49 by 120 pixels.
; PLAN: r0=210(x), r1=32(y), r2=49(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 32
LDI r2, 49
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
