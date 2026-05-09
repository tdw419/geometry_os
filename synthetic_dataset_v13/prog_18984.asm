; DESCRIPTION: Composite: Creates a green rectangular region at (291, 28) spanning 98 by 44 pixels then Renders a black line between points (308, 88) and (10, 254) then Renders a white disk with center (256, 115) and radius 68.
; PLAN: r0=291(x), r1=28(y), r2=98(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=308(x1), r6=88(y1), r7=10(x2), r8=254(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=256(x), r11=115(y), r12=68(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 291
LDI r1, 28
LDI r2, 98
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 88
LDI r7, 10
LDI r8, 254
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 115
LDI r12, 68
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
