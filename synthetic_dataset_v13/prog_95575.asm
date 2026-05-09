; DESCRIPTION: Composite: Renders a orange line between points (120, 217) and (71, 55) then Renders a blue box of size 13x67 starting at (288, 92) then Creates a cyan circular shape at (400, 150) with radius 23.
; PLAN: r0=120(x1), r1=217(y1), r2=71(x2), r3=55(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=288(x), r6=92(y), r7=13(width), r8=67(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=400(x), r11=150(y), r12=23(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 120
LDI r1, 217
LDI r2, 71
LDI r3, 55
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 92
LDI r7, 13
LDI r8, 67
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 400
LDI r11, 150
LDI r12, 23
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
