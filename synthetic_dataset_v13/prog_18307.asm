; DESCRIPTION: Composite: Renders a green disk with center (423, 144) and radius 71 then Renders a green box of size 66x52 starting at (349, 199) then Draws a red line from (227, 30) to (16, 116).
; PLAN: r0=423(x), r1=144(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=349(x), r6=199(y), r7=66(width), r8=52(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=227(x1), r11=30(y1), r12=16(x2), r13=116(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 423
LDI r1, 144
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 349
LDI r6, 199
LDI r7, 66
LDI r8, 52
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 227
LDI r11, 30
LDI r12, 16
LDI r13, 116
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
