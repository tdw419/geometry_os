; DESCRIPTION: Composite: Renders a white line between points (181, 71) and (342, 8) then Renders a blue box of size 87x103 starting at (282, 107) then Renders a white disk with center (383, 89) and radius 50.
; PLAN: r0=181(x1), r1=71(y1), r2=342(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=107(y), r7=87(width), r8=103(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=383(x), r11=89(y), r12=50(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 181
LDI r1, 71
LDI r2, 342
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 107
LDI r7, 87
LDI r8, 103
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 383
LDI r11, 89
LDI r12, 50
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
