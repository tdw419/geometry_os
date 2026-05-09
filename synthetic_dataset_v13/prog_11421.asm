; DESCRIPTION: Draws a yellow circle centered at (374, 72) with radius 37.
; PLAN: r0=374(x), r1=72(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 72
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
