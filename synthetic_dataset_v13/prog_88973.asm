; DESCRIPTION: Composite: Creates a cyan rectangular region at (441, 85) spanning 26 by 20 pixels then Places a black line segment connecting (194, 231) to (275, 107) then Renders a black disk with center (374, 136) and radius 80.
; PLAN: r0=441(x), r1=85(y), r2=26(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=194(x1), r6=231(y1), r7=275(x2), r8=107(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=374(x), r11=136(y), r12=80(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 441
LDI r1, 85
LDI r2, 26
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 231
LDI r7, 275
LDI r8, 107
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 374
LDI r11, 136
LDI r12, 80
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
