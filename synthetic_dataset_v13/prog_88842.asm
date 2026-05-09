; DESCRIPTION: Composite: Renders a blue box of size 77x112 starting at (253, 115) then Renders a green line between points (154, 255) and (51, 114) then Renders a white disk with center (265, 171) and radius 75.
; PLAN: r0=253(x), r1=115(y), r2=77(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=154(x1), r6=255(y1), r7=51(x2), r8=114(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=265(x), r11=171(y), r12=75(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 253
LDI r1, 115
LDI r2, 77
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 255
LDI r7, 51
LDI r8, 114
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 265
LDI r11, 171
LDI r12, 75
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
