; DESCRIPTION: Composite: Draws a black line from (357, 7) to (356, 162) then Renders a orange box of size 117x76 starting at (390, 13) then Places a red dot at position (334, 200).
; PLAN: r0=357(x1), r1=7(y1), r2=356(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=390(x), r6=13(y), r7=117(width), r8=76(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=334(x), r11=200(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 357
LDI r1, 7
LDI r2, 356
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 13
LDI r7, 117
LDI r8, 76
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 334
LDI r11, 200
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
