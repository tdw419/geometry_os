; DESCRIPTION: Composite: Draws a orange circle centered at (137, 87) with radius 25 then Places a purple line segment connecting (53, 124) to (466, 186) then Renders a black box of size 32x10 starting at (356, 164).
; PLAN: r0=137(x), r1=87(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=53(x1), r6=124(y1), r7=466(x2), r8=186(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=356(x), r11=164(y), r12=32(width), r13=10(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 137
LDI r1, 87
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 53
LDI r6, 124
LDI r7, 466
LDI r8, 186
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 356
LDI r11, 164
LDI r12, 32
LDI r13, 10
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
