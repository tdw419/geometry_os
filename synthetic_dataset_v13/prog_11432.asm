; DESCRIPTION: Draws a yellow circle centered at (440, 110) with radius 65.
; PLAN: r0=440(x), r1=110(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 440
LDI r1, 110
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
