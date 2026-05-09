; DESCRIPTION: Composite: Renders a green box of size 62x10 starting at (66, 227) then Places a red line segment connecting (438, 26) to (164, 187) then Places a white circle of radius 44 at center (90, 96).
; PLAN: r0=66(x), r1=227(y), r2=62(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=438(x1), r6=26(y1), r7=164(x2), r8=187(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=90(x), r11=96(y), r12=44(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 66
LDI r1, 227
LDI r2, 62
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 26
LDI r7, 164
LDI r8, 187
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 90
LDI r11, 96
LDI r12, 44
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
