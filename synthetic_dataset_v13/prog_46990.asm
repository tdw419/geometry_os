; DESCRIPTION: Composite: Sets a single black pixel at (374, 177) then Creates a green rectangular region at (406, 123) spanning 51 by 80 pixels.
; PLAN: r0=374(x), r1=177(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=406(x), r6=123(y), r7=51(width), r8=80(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 374
LDI r1, 177
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 406
LDI r6, 123
LDI r7, 51
LDI r8, 80
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
