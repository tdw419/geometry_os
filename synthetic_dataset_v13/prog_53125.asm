; DESCRIPTION: Draws a yellow circle centered at (160, 127) with radius 80.
; PLAN: r0=160(x), r1=127(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 127
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
