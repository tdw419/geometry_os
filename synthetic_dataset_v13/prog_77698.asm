; DESCRIPTION: Composite: Draws a orange line from (253, 184) to (207, 205) then Creates a blue rectangular region at (66, 167) spanning 99 by 28 pixels then Places a green dot at position (156, 242).
; PLAN: r0=253(x1), r1=184(y1), r2=207(x2), r3=205(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=66(x), r6=167(y), r7=99(width), r8=28(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=156(x), r11=242(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 253
LDI r1, 184
LDI r2, 207
LDI r3, 205
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 167
LDI r7, 99
LDI r8, 28
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 156
LDI r11, 242
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
