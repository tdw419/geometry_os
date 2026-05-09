; DESCRIPTION: Composite: Renders a yellow box of size 68x119 starting at (283, 130) then Sets a single yellow pixel at (5, 211).
; PLAN: r0=283(x), r1=130(y), r2=68(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=5(x), r6=211(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 283
LDI r1, 130
LDI r2, 68
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 5
LDI r6, 211
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
