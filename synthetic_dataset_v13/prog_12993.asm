; DESCRIPTION: Draws a yellow circle centered at (428, 216) with radius 10.
; PLAN: r0=428(x), r1=216(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 216
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
