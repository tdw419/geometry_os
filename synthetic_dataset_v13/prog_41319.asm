; DESCRIPTION: Composite: Places a purple line segment connecting (211, 61) to (9, 46) then Draws a green rectangle at (161, 45) with width 70 and height 92 then Places a black dot at position (301, 85).
; PLAN: r0=211(x1), r1=61(y1), r2=9(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=161(x), r6=45(y), r7=70(width), r8=92(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=301(x), r11=85(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 211
LDI r1, 61
LDI r2, 9
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 45
LDI r7, 70
LDI r8, 92
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 301
LDI r11, 85
LDI r12, 0x000000
PSET r10, r11, r12
HALT
