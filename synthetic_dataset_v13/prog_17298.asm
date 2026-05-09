; DESCRIPTION: Creates a magenta rectangular region at (38, 32) spanning 39 by 119 pixels.
; PLAN: r0=38(x), r1=32(y), r2=39(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 32
LDI r2, 39
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
