; DESCRIPTION: Composite: Renders a green line between points (78, 124) and (28, 14) then Places a black circle of radius 75 at center (307, 170) then Draws a purple rectangle at (330, 187) with width 58 and height 54.
; PLAN: r0=78(x1), r1=124(y1), r2=28(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=307(x), r6=170(y), r7=75(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=330(x), r11=187(y), r12=58(width), r13=54(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 78
LDI r1, 124
LDI r2, 28
LDI r3, 14
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 170
LDI r7, 75
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 330
LDI r11, 187
LDI r12, 58
LDI r13, 54
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
