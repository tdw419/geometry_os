; DESCRIPTION: Composite: Renders a yellow line between points (198, 9) and (492, 45) then Draws a red rectangle at (143, 13) with width 91 and height 106 then Sets a single red pixel at (445, 110).
; PLAN: r0=198(x1), r1=9(y1), r2=492(x2), r3=45(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=143(x), r6=13(y), r7=91(width), r8=106(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=445(x), r11=110(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 198
LDI r1, 9
LDI r2, 492
LDI r3, 45
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 13
LDI r7, 91
LDI r8, 106
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 445
LDI r11, 110
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
