; DESCRIPTION: Composite: Renders a red disk with center (131, 149) and radius 63 then Renders a white box of size 29x73 starting at (225, 36) then Renders a yellow line between points (30, 10) and (323, 88).
; PLAN: r0=131(x), r1=149(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=225(x), r6=36(y), r7=29(width), r8=73(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=30(x1), r11=10(y1), r12=323(x2), r13=88(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 131
LDI r1, 149
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 225
LDI r6, 36
LDI r7, 29
LDI r8, 73
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 30
LDI r11, 10
LDI r12, 323
LDI r13, 88
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
