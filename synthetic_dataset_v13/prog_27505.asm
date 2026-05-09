; DESCRIPTION: Creates a magenta rectangular region at (142, 38) spanning 35 by 89 pixels.
; PLAN: r0=142(x), r1=38(y), r2=35(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 38
LDI r2, 35
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
