; DESCRIPTION: Composite: Creates a purple rectangular region at (105, 49) spanning 55 by 64 pixels then Creates a cyan circular shape at (454, 119) with radius 48 then Renders a red line between points (21, 215) and (6, 200).
; PLAN: r0=105(x), r1=49(y), r2=55(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=454(x), r6=119(y), r7=48(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=21(x1), r11=215(y1), r12=6(x2), r13=200(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 105
LDI r1, 49
LDI r2, 55
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 119
LDI r7, 48
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 21
LDI r11, 215
LDI r12, 6
LDI r13, 200
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
