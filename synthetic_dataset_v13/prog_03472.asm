; DESCRIPTION: Composite: Places a red circle of radius 48 at center (107, 82) then Renders a white line between points (7, 68) and (359, 185) then Renders a black box of size 50x50 starting at (145, 114).
; PLAN: r0=107(x), r1=82(y), r2=48(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=7(x1), r6=68(y1), r7=359(x2), r8=185(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=145(x), r11=114(y), r12=50(width), r13=50(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 107
LDI r1, 82
LDI r2, 48
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 7
LDI r6, 68
LDI r7, 359
LDI r8, 185
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 145
LDI r11, 114
LDI r12, 50
LDI r13, 50
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
