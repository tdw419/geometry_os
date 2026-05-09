; DESCRIPTION: Draws a yellow circle centered at (480, 118) with radius 10.
; PLAN: r0=480(x), r1=118(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 480
LDI r1, 118
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
