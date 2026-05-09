; DESCRIPTION: Composite: Sets a single orange pixel at (49, 21) then Renders a black box of size 115x119 starting at (19, 130).
; PLAN: r0=49(x), r1=21(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=19(x), r6=130(y), r7=115(width), r8=119(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 49
LDI r1, 21
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 19
LDI r6, 130
LDI r7, 115
LDI r8, 119
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
