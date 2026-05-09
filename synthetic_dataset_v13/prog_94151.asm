; DESCRIPTION: Composite: Places a black line segment connecting (461, 67) to (80, 185) then Places a orange circle of radius 54 at center (404, 196) then Creates a black rectangular region at (403, 13) spanning 37 by 24 pixels.
; PLAN: r0=461(x1), r1=67(y1), r2=80(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=404(x), r6=196(y), r7=54(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=403(x), r11=13(y), r12=37(width), r13=24(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 461
LDI r1, 67
LDI r2, 80
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 196
LDI r7, 54
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 403
LDI r11, 13
LDI r12, 37
LDI r13, 24
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
