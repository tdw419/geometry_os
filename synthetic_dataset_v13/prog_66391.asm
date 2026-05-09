; DESCRIPTION: Composite: Draws a orange circle centered at (245, 130) with radius 67 then Sets a single yellow pixel at (293, 65).
; PLAN: r0=245(x), r1=130(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=293(x), r6=65(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 245
LDI r1, 130
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 293
LDI r6, 65
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
