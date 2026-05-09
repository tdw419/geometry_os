; DESCRIPTION: Creates a magenta rectangular region at (226, 119) spanning 33 by 52 pixels.
; PLAN: r0=226(x), r1=119(y), r2=33(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 119
LDI r2, 33
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
