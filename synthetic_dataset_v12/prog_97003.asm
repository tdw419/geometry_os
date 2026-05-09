; DESCRIPTION: Composite: Places a orange line segment connecting (117, 65) to (493, 91) then Draws a orange rectangle at (278, 110) with width 36 and height 59 then Places a blue dot at position (251, 6).
; PLAN: r0=117(x1), r1=65(y1), r2=493(x2), r3=91(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=278(x), r6=110(y), r7=36(width), r8=59(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=251(x), r11=6(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 117
LDI r1, 65
LDI r2, 493
LDI r3, 91
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 110
LDI r7, 36
LDI r8, 59
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 251
LDI r11, 6
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
