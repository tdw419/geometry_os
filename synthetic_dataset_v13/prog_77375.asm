; DESCRIPTION: Composite: Creates a black circular shape at (316, 88) with radius 15 then Renders a white line between points (21, 137) and (458, 108) then Renders a cyan box of size 60x104 starting at (99, 122).
; PLAN: r0=316(x), r1=88(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=21(x1), r6=137(y1), r7=458(x2), r8=108(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=99(x), r11=122(y), r12=60(width), r13=104(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 316
LDI r1, 88
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 21
LDI r6, 137
LDI r7, 458
LDI r8, 108
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 122
LDI r12, 60
LDI r13, 104
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
