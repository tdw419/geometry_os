; DESCRIPTION: Composite: Places a magenta 92x103 rectangle at position (158, 1) then Renders a black line between points (260, 112) and (135, 154) then Sets a single black pixel at (385, 105).
; PLAN: r0=158(x), r1=1(y), r2=92(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=260(x1), r6=112(y1), r7=135(x2), r8=154(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=385(x), r11=105(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 158
LDI r1, 1
LDI r2, 92
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 112
LDI r7, 135
LDI r8, 154
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 385
LDI r11, 105
LDI r12, 0x000000
PSET r10, r11, r12
HALT
