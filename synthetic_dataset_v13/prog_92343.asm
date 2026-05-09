; DESCRIPTION: Composite: Creates a black rectangular region at (164, 91) spanning 74 by 74 pixels then Places a orange line segment connecting (220, 170) to (317, 81) then Places a yellow dot at position (406, 130).
; PLAN: r0=164(x), r1=91(y), r2=74(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=220(x1), r6=170(y1), r7=317(x2), r8=81(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=406(x), r11=130(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 164
LDI r1, 91
LDI r2, 74
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 170
LDI r7, 317
LDI r8, 81
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 406
LDI r11, 130
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
