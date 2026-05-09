; DESCRIPTION: Composite: Places a black line segment connecting (406, 250) to (207, 14) then Places a yellow 78x16 rectangle at position (370, 3) then Sets a single black pixel at (37, 140).
; PLAN: r0=406(x1), r1=250(y1), r2=207(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=370(x), r6=3(y), r7=78(width), r8=16(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=37(x), r11=140(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 406
LDI r1, 250
LDI r2, 207
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 3
LDI r7, 78
LDI r8, 16
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 37
LDI r11, 140
LDI r12, 0x000000
PSET r10, r11, r12
HALT
