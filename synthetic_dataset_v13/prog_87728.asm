; DESCRIPTION: Draws a blue circle centered at (172, 187) with radius 68.
; PLAN: r0=172(x), r1=187(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 187
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
