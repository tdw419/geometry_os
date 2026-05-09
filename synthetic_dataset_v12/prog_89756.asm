; DESCRIPTION: Composite: Draws a green line from (214, 96) to (137, 74) then Creates a yellow circular shape at (417, 176) with radius 75 then Renders a black box of size 24x85 starting at (289, 52).
; PLAN: r0=214(x1), r1=96(y1), r2=137(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=417(x), r6=176(y), r7=75(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=289(x), r11=52(y), r12=24(width), r13=85(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 214
LDI r1, 96
LDI r2, 137
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 417
LDI r6, 176
LDI r7, 75
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 289
LDI r11, 52
LDI r12, 24
LDI r13, 85
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
