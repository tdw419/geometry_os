; DESCRIPTION: Composite: Places a white dot at position (157, 8) then Places a orange line segment connecting (510, 48) to (317, 188) then Draws a green circle centered at (391, 106) with radius 70.
; PLAN: r0=157(x), r1=8(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=510(x1), r6=48(y1), r7=317(x2), r8=188(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=391(x), r11=106(y), r12=70(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 157
LDI r1, 8
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 510
LDI r6, 48
LDI r7, 317
LDI r8, 188
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 391
LDI r11, 106
LDI r12, 70
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
