; DESCRIPTION: Composite: Renders a white box of size 94x98 starting at (148, 14) then Renders a black disk with center (151, 101) and radius 47 then Renders a cyan line between points (369, 236) and (511, 81).
; PLAN: r0=148(x), r1=14(y), r2=94(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=151(x), r6=101(y), r7=47(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=369(x1), r11=236(y1), r12=511(x2), r13=81(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 148
LDI r1, 14
LDI r2, 94
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 101
LDI r7, 47
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 369
LDI r11, 236
LDI r12, 511
LDI r13, 81
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
