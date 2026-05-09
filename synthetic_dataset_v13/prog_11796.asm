; DESCRIPTION: Composite: Places a yellow dot at position (141, 73) then Creates a cyan rectangular region at (417, 156) spanning 46 by 50 pixels then Draws a blue circle centered at (158, 170) with radius 23.
; PLAN: r0=141(x), r1=73(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=417(x), r6=156(y), r7=46(width), r8=50(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=158(x), r11=170(y), r12=23(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 141
LDI r1, 73
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 417
LDI r6, 156
LDI r7, 46
LDI r8, 50
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 158
LDI r11, 170
LDI r12, 23
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
