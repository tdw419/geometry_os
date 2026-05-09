; DESCRIPTION: Draws a yellow circle centered at (186, 70) with radius 22.
; PLAN: r0=186(x), r1=70(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 70
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
