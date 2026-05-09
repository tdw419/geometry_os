; DESCRIPTION: Composite: Draws a yellow rectangle at (345, 179) with width 54 and height 50 then Sets a single yellow pixel at (482, 115) then Places a magenta line segment connecting (321, 24) to (391, 94).
; PLAN: r0=345(x), r1=179(y), r2=54(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=482(x), r6=115(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=321(x1), r11=24(y1), r12=391(x2), r13=94(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 345
LDI r1, 179
LDI r2, 54
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 482
LDI r6, 115
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 321
LDI r11, 24
LDI r12, 391
LDI r13, 94
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
