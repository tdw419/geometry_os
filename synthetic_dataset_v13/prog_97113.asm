; DESCRIPTION: Composite: Creates a purple rectangular region at (358, 88) spanning 10 by 61 pixels then Draws a purple line from (227, 142) to (194, 242) then Renders a cyan disk with center (225, 81) and radius 43.
; PLAN: r0=358(x), r1=88(y), r2=10(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=227(x1), r6=142(y1), r7=194(x2), r8=242(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=225(x), r11=81(y), r12=43(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 358
LDI r1, 88
LDI r2, 10
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 142
LDI r7, 194
LDI r8, 242
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 225
LDI r11, 81
LDI r12, 43
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
