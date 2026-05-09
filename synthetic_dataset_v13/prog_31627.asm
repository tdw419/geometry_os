; DESCRIPTION: Composite: Draws a cyan rectangle at (94, 54) with width 67 and height 104 then Creates a yellow circular shape at (89, 81) with radius 68 then Renders a black line between points (403, 67) and (402, 239).
; PLAN: r0=94(x), r1=54(y), r2=67(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=89(x), r6=81(y), r7=68(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=403(x1), r11=67(y1), r12=402(x2), r13=239(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 94
LDI r1, 54
LDI r2, 67
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 81
LDI r7, 68
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 403
LDI r11, 67
LDI r12, 402
LDI r13, 239
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
