; DESCRIPTION: Composite: Draws a purple circle centered at (150, 67) with radius 35 then Sets a single yellow pixel at (470, 25).
; PLAN: r0=150(x), r1=67(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=470(x), r6=25(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 150
LDI r1, 67
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 470
LDI r6, 25
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
