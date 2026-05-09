; DESCRIPTION: Draws a purple circle centered at (298, 144) with radius 28.
; PLAN: r0=298(x), r1=144(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 144
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
