; DESCRIPTION: Composite: Creates a white circular shape at (324, 198) with radius 48 then Renders a purple line between points (121, 201) and (289, 93) then Renders a blue box of size 47x38 starting at (288, 66).
; PLAN: r0=324(x), r1=198(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=121(x1), r6=201(y1), r7=289(x2), r8=93(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=288(x), r11=66(y), r12=47(width), r13=38(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 324
LDI r1, 198
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 121
LDI r6, 201
LDI r7, 289
LDI r8, 93
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 288
LDI r11, 66
LDI r12, 47
LDI r13, 38
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
