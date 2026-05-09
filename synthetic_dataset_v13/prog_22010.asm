; DESCRIPTION: Composite: Renders a red box of size 13x100 starting at (97, 23) then Renders a purple line between points (390, 9) and (390, 120) then Places a orange dot at position (90, 7).
; PLAN: r0=97(x), r1=23(y), r2=13(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=390(x1), r6=9(y1), r7=390(x2), r8=120(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=90(x), r11=7(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 97
LDI r1, 23
LDI r2, 13
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 9
LDI r7, 390
LDI r8, 120
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 90
LDI r11, 7
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
