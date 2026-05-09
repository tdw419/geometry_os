; DESCRIPTION: Composite: Places a purple line segment connecting (232, 198) to (385, 102) then Draws a green rectangle at (213, 88) with width 48 and height 105 then Sets a single cyan pixel at (186, 114).
; PLAN: r0=232(x1), r1=198(y1), r2=385(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=213(x), r6=88(y), r7=48(width), r8=105(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=186(x), r11=114(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 232
LDI r1, 198
LDI r2, 385
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 88
LDI r7, 48
LDI r8, 105
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 186
LDI r11, 114
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
