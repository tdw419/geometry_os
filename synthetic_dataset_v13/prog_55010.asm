; DESCRIPTION: Composite: Renders a blue disk with center (447, 92) and radius 22 then Renders a blue box of size 28x30 starting at (392, 52) then Draws a yellow line from (442, 14) to (125, 176).
; PLAN: r0=447(x), r1=92(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=392(x), r6=52(y), r7=28(width), r8=30(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=442(x1), r11=14(y1), r12=125(x2), r13=176(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 447
LDI r1, 92
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 392
LDI r6, 52
LDI r7, 28
LDI r8, 30
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 442
LDI r11, 14
LDI r12, 125
LDI r13, 176
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
