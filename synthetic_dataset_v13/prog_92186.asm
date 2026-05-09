; DESCRIPTION: Composite: Places a blue dot at position (24, 164) then Places a white line segment connecting (97, 242) to (279, 137) then Creates a orange rectangular region at (393, 50) spanning 65 by 68 pixels.
; PLAN: r0=24(x), r1=164(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=97(x1), r6=242(y1), r7=279(x2), r8=137(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=393(x), r11=50(y), r12=65(width), r13=68(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 24
LDI r1, 164
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 97
LDI r6, 242
LDI r7, 279
LDI r8, 137
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 393
LDI r11, 50
LDI r12, 65
LDI r13, 68
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
