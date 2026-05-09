; DESCRIPTION: Composite: Renders a green line between points (408, 169) and (191, 1) then Places a blue 95x20 rectangle at position (250, 180) then Places a purple dot at position (69, 249).
; PLAN: r0=408(x1), r1=169(y1), r2=191(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=250(x), r6=180(y), r7=95(width), r8=20(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=69(x), r11=249(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 408
LDI r1, 169
LDI r2, 191
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 180
LDI r7, 95
LDI r8, 20
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 69
LDI r11, 249
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
