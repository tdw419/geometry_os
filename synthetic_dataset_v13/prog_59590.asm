; DESCRIPTION: Composite: Draws a yellow rectangle at (377, 11) with width 26 and height 14 then Draws a cyan line from (418, 177) to (85, 138) then Draws a purple circle centered at (263, 94) with radius 29.
; PLAN: r0=377(x), r1=11(y), r2=26(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=418(x1), r6=177(y1), r7=85(x2), r8=138(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=263(x), r11=94(y), r12=29(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 377
LDI r1, 11
LDI r2, 26
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 177
LDI r7, 85
LDI r8, 138
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 263
LDI r11, 94
LDI r12, 29
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
