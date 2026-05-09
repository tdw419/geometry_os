; DESCRIPTION: Composite: Sets a single purple pixel at (175, 155) then Creates a green rectangular region at (462, 167) spanning 23 by 71 pixels.
; PLAN: r0=175(x), r1=155(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=462(x), r6=167(y), r7=23(width), r8=71(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 175
LDI r1, 155
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 462
LDI r6, 167
LDI r7, 23
LDI r8, 71
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
