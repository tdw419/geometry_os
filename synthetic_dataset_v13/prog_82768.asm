; DESCRIPTION: Composite: Places a yellow circle of radius 52 at center (220, 141) then Draws a green line from (73, 13) to (124, 123) then Draws a blue rectangle at (84, 127) with width 21 and height 36.
; PLAN: r0=220(x), r1=141(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=73(x1), r6=13(y1), r7=124(x2), r8=123(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=84(x), r11=127(y), r12=21(width), r13=36(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 220
LDI r1, 141
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 73
LDI r6, 13
LDI r7, 124
LDI r8, 123
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 84
LDI r11, 127
LDI r12, 21
LDI r13, 36
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
