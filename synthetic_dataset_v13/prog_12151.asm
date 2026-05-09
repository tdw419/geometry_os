; DESCRIPTION: Composite: Sets a single blue pixel at (281, 91) then Renders a white disk with center (49, 88) and radius 42.
; PLAN: r0=281(x), r1=91(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=49(x), r6=88(y), r7=42(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 281
LDI r1, 91
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 49
LDI r6, 88
LDI r7, 42
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
