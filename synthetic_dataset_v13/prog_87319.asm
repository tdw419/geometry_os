; DESCRIPTION: Composite: Renders a white line between points (12, 213) and (11, 178) then Creates a black rectangular region at (353, 39) spanning 90 by 117 pixels then Places a orange dot at position (287, 78).
; PLAN: r0=12(x1), r1=213(y1), r2=11(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=353(x), r6=39(y), r7=90(width), r8=117(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=287(x), r11=78(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 12
LDI r1, 213
LDI r2, 11
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 39
LDI r7, 90
LDI r8, 117
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 287
LDI r11, 78
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
