; DESCRIPTION: Composite: Sets a single cyan pixel at (355, 186) then Draws a orange circle centered at (432, 146) with radius 15.
; PLAN: r0=355(x), r1=186(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=432(x), r6=146(y), r7=15(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 355
LDI r1, 186
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 432
LDI r6, 146
LDI r7, 15
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
