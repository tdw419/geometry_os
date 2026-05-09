; DESCRIPTION: Composite: Places a black line segment connecting (477, 184) to (369, 215) then Places a orange 24x12 rectangle at position (215, 67) then Renders a yellow disk with center (340, 97) and radius 35.
; PLAN: r0=477(x1), r1=184(y1), r2=369(x2), r3=215(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=215(x), r6=67(y), r7=24(width), r8=12(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=340(x), r11=97(y), r12=35(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 477
LDI r1, 184
LDI r2, 369
LDI r3, 215
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 67
LDI r7, 24
LDI r8, 12
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 340
LDI r11, 97
LDI r12, 35
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
