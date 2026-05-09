; DESCRIPTION: Composite: Sets a single cyan pixel at (363, 27) then Draws a orange circle centered at (242, 116) with radius 66.
; PLAN: r0=363(x), r1=27(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=242(x), r6=116(y), r7=66(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 363
LDI r1, 27
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 242
LDI r6, 116
LDI r7, 66
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
