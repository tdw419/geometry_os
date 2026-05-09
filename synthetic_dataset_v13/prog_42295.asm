; DESCRIPTION: Composite: Creates a black circular shape at (195, 190) with radius 44 then Renders a black line between points (34, 22) and (430, 29) then Renders a black box of size 70x94 starting at (324, 7).
; PLAN: r0=195(x), r1=190(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=34(x1), r6=22(y1), r7=430(x2), r8=29(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=324(x), r11=7(y), r12=70(width), r13=94(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 195
LDI r1, 190
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 34
LDI r6, 22
LDI r7, 430
LDI r8, 29
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 324
LDI r11, 7
LDI r12, 70
LDI r13, 94
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
