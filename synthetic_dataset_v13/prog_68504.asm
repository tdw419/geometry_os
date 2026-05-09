; DESCRIPTION: Composite: Draws a cyan rectangle at (35, 215) with width 71 and height 26 then Sets a single yellow pixel at (458, 123) then Places a yellow line segment connecting (162, 185) to (300, 43).
; PLAN: r0=35(x), r1=215(y), r2=71(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=458(x), r6=123(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=162(x1), r11=185(y1), r12=300(x2), r13=43(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 35
LDI r1, 215
LDI r2, 71
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 123
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 162
LDI r11, 185
LDI r12, 300
LDI r13, 43
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
