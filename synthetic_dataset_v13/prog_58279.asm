; DESCRIPTION: Draws a yellow circle centered at (87, 89) with radius 80.
; PLAN: r0=87(x), r1=89(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 89
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
