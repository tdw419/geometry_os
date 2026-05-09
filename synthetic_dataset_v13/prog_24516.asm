; DESCRIPTION: Composite: Draws a yellow rectangle at (34, 161) with width 70 and height 20 then Draws a purple line from (193, 81) to (468, 67) then Places a orange dot at position (401, 90).
; PLAN: r0=34(x), r1=161(y), r2=70(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=193(x1), r6=81(y1), r7=468(x2), r8=67(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=401(x), r11=90(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 34
LDI r1, 161
LDI r2, 70
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 81
LDI r7, 468
LDI r8, 67
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 401
LDI r11, 90
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
