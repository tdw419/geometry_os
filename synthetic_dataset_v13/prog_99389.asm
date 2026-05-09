; DESCRIPTION: Composite: Sets a single white pixel at (287, 158) then Draws a orange line from (364, 28) to (220, 44) then Draws a cyan circle centered at (317, 163) with radius 59.
; PLAN: r0=287(x), r1=158(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=364(x1), r6=28(y1), r7=220(x2), r8=44(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=317(x), r11=163(y), r12=59(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 287
LDI r1, 158
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 364
LDI r6, 28
LDI r7, 220
LDI r8, 44
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 317
LDI r11, 163
LDI r12, 59
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
