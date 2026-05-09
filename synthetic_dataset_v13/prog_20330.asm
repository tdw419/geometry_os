; DESCRIPTION: Composite: Sets a single black pixel at (370, 38) then Places a purple line segment connecting (369, 220) to (344, 243) then Places a orange 101x101 rectangle at position (288, 152).
; PLAN: r0=370(x), r1=38(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=369(x1), r6=220(y1), r7=344(x2), r8=243(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=288(x), r11=152(y), r12=101(width), r13=101(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 370
LDI r1, 38
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 369
LDI r6, 220
LDI r7, 344
LDI r8, 243
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 288
LDI r11, 152
LDI r12, 101
LDI r13, 101
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
