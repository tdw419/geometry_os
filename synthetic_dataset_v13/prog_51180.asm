; DESCRIPTION: Composite: Places a black dot at position (147, 174) then Creates a yellow rectangular region at (43, 130) spanning 49 by 60 pixels.
; PLAN: r0=147(x), r1=174(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=43(x), r6=130(y), r7=49(width), r8=60(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 147
LDI r1, 174
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 43
LDI r6, 130
LDI r7, 49
LDI r8, 60
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
