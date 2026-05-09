; DESCRIPTION: Composite: Places a white line segment connecting (85, 231) to (144, 236) then Renders a purple disk with center (350, 81) and radius 74 then Renders a blue box of size 105x27 starting at (137, 104).
; PLAN: r0=85(x1), r1=231(y1), r2=144(x2), r3=236(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=350(x), r6=81(y), r7=74(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=137(x), r11=104(y), r12=105(width), r13=27(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 85
LDI r1, 231
LDI r2, 144
LDI r3, 236
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 81
LDI r7, 74
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 137
LDI r11, 104
LDI r12, 105
LDI r13, 27
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
