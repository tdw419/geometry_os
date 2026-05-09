; DESCRIPTION: Composite: Draws a green line from (110, 196) to (195, 170) then Draws a red rectangle at (249, 134) with width 70 and height 78 then Places a white circle of radius 58 at center (345, 135).
; PLAN: r0=110(x1), r1=196(y1), r2=195(x2), r3=170(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=249(x), r6=134(y), r7=70(width), r8=78(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=345(x), r11=135(y), r12=58(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 110
LDI r1, 196
LDI r2, 195
LDI r3, 170
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 134
LDI r7, 70
LDI r8, 78
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 345
LDI r11, 135
LDI r12, 58
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
