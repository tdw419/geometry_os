; DESCRIPTION: Composite: Creates a red circular shape at (102, 192) with radius 61 then Creates a blue rectangular region at (272, 115) spanning 23 by 25 pixels then Renders a white line between points (374, 33) and (398, 148).
; PLAN: r0=102(x), r1=192(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=272(x), r6=115(y), r7=23(width), r8=25(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=374(x1), r11=33(y1), r12=398(x2), r13=148(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 102
LDI r1, 192
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 272
LDI r6, 115
LDI r7, 23
LDI r8, 25
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 374
LDI r11, 33
LDI r12, 398
LDI r13, 148
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
