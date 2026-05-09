; DESCRIPTION: Composite: Places a red dot at position (448, 143) then Renders a green line between points (302, 69) and (9, 160) then Renders a black box of size 12x112 starting at (103, 80).
; PLAN: r0=448(x), r1=143(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=302(x1), r6=69(y1), r7=9(x2), r8=160(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=103(x), r11=80(y), r12=12(width), r13=112(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 448
LDI r1, 143
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 302
LDI r6, 69
LDI r7, 9
LDI r8, 160
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 103
LDI r11, 80
LDI r12, 12
LDI r13, 112
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
