; DESCRIPTION: Draws a yellow circle centered at (16, 112) with radius 10.
; PLAN: r0=16(x), r1=112(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 16
LDI r1, 112
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
