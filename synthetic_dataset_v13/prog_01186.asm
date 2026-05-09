; DESCRIPTION: Composite: Places a purple line segment connecting (339, 45) to (144, 115) then Places a orange dot at position (51, 120) then Places a purple 40x88 rectangle at position (130, 120).
; PLAN: r0=339(x1), r1=45(y1), r2=144(x2), r3=115(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=51(x), r6=120(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=130(x), r11=120(y), r12=40(width), r13=88(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 339
LDI r1, 45
LDI r2, 144
LDI r3, 115
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 120
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 130
LDI r11, 120
LDI r12, 40
LDI r13, 88
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
