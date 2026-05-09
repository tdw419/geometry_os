; DESCRIPTION: Composite: Draws a purple line from (449, 230) to (290, 242) then Renders a orange box of size 26x15 starting at (344, 153) then Sets a single white pixel at (485, 243).
; PLAN: r0=449(x1), r1=230(y1), r2=290(x2), r3=242(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=344(x), r6=153(y), r7=26(width), r8=15(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=485(x), r11=243(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 449
LDI r1, 230
LDI r2, 290
LDI r3, 242
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 153
LDI r7, 26
LDI r8, 15
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 485
LDI r11, 243
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
