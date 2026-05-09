; DESCRIPTION: Composite: Sets a single orange pixel at (459, 99) then Renders a magenta box of size 83x37 starting at (140, 72).
; PLAN: r0=459(x), r1=99(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=140(x), r6=72(y), r7=83(width), r8=37(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 459
LDI r1, 99
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 140
LDI r6, 72
LDI r7, 83
LDI r8, 37
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
