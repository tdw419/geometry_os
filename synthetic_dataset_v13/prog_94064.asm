; DESCRIPTION: Composite: Draws a red rectangle at (401, 65) with width 90 and height 24 then Places a yellow line segment connecting (344, 31) to (17, 123) then Sets a single cyan pixel at (62, 60).
; PLAN: r0=401(x), r1=65(y), r2=90(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=344(x1), r6=31(y1), r7=17(x2), r8=123(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=62(x), r11=60(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 401
LDI r1, 65
LDI r2, 90
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 31
LDI r7, 17
LDI r8, 123
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 62
LDI r11, 60
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
