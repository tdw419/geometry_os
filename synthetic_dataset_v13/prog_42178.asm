; DESCRIPTION: Creates a magenta rectangular region at (305, 60) spanning 15 by 112 pixels.
; PLAN: r0=305(x), r1=60(y), r2=15(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 60
LDI r2, 15
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
