; DESCRIPTION: Composite: Places a green line segment connecting (427, 154) to (320, 214) then Renders a purple disk with center (466, 145) and radius 24 then Places a blue 70x90 rectangle at position (114, 104).
; PLAN: r0=427(x1), r1=154(y1), r2=320(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=466(x), r6=145(y), r7=24(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=114(x), r11=104(y), r12=70(width), r13=90(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 427
LDI r1, 154
LDI r2, 320
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 145
LDI r7, 24
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 114
LDI r11, 104
LDI r12, 70
LDI r13, 90
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
