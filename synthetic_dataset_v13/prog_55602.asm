; DESCRIPTION: Composite: Sets a single black pixel at (48, 78) then Creates a cyan rectangular region at (17, 130) spanning 107 by 118 pixels.
; PLAN: r0=48(x), r1=78(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=17(x), r6=130(y), r7=107(width), r8=118(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 48
LDI r1, 78
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 17
LDI r6, 130
LDI r7, 107
LDI r8, 118
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
