; DESCRIPTION: Creates a magenta rectangular region at (172, 29) spanning 35 by 52 pixels.
; PLAN: r0=172(x), r1=29(y), r2=35(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 29
LDI r2, 35
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
