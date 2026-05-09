; DESCRIPTION: Composite: Places a red dot at position (357, 199) then Renders a black box of size 101x66 starting at (188, 47) then Draws a purple circle centered at (154, 95) with radius 26.
; PLAN: r0=357(x), r1=199(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=188(x), r6=47(y), r7=101(width), r8=66(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=154(x), r11=95(y), r12=26(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 357
LDI r1, 199
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 188
LDI r6, 47
LDI r7, 101
LDI r8, 66
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 154
LDI r11, 95
LDI r12, 26
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
