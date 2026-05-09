; DESCRIPTION: Draws a yellow circle centered at (300, 80) with radius 76.
; PLAN: r0=300(x), r1=80(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 80
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
