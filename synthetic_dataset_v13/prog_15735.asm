; DESCRIPTION: Composite: Places a yellow circle of radius 44 at center (356, 150) then Renders a green box of size 11x42 starting at (339, 145) then Renders a red line between points (335, 136) and (70, 72).
; PLAN: r0=356(x), r1=150(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=339(x), r6=145(y), r7=11(width), r8=42(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=335(x1), r11=136(y1), r12=70(x2), r13=72(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 356
LDI r1, 150
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 339
LDI r6, 145
LDI r7, 11
LDI r8, 42
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 335
LDI r11, 136
LDI r12, 70
LDI r13, 72
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
