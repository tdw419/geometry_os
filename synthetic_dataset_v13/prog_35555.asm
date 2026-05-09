; DESCRIPTION: Composite: Renders a yellow line between points (265, 166) and (466, 223) then Renders a cyan box of size 95x72 starting at (4, 22) then Creates a green circular shape at (122, 87) with radius 74.
; PLAN: r0=265(x1), r1=166(y1), r2=466(x2), r3=223(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=4(x), r6=22(y), r7=95(width), r8=72(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=122(x), r11=87(y), r12=74(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 265
LDI r1, 166
LDI r2, 466
LDI r3, 223
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 4
LDI r6, 22
LDI r7, 95
LDI r8, 72
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 122
LDI r11, 87
LDI r12, 74
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
