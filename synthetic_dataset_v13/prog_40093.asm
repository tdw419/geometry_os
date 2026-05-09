; DESCRIPTION: Composite: Renders a red line between points (142, 3) and (495, 15) then Places a yellow 21x79 rectangle at position (285, 177) then Sets a single blue pixel at (270, 150).
; PLAN: r0=142(x1), r1=3(y1), r2=495(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=285(x), r6=177(y), r7=21(width), r8=79(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=270(x), r11=150(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 142
LDI r1, 3
LDI r2, 495
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 177
LDI r7, 21
LDI r8, 79
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 270
LDI r11, 150
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
