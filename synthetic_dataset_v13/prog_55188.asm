; DESCRIPTION: Composite: Places a red 12x65 rectangle at position (221, 81) then Renders a blue line between points (103, 56) and (318, 145) then Sets a single purple pixel at (371, 148).
; PLAN: r0=221(x), r1=81(y), r2=12(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=103(x1), r6=56(y1), r7=318(x2), r8=145(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=371(x), r11=148(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 221
LDI r1, 81
LDI r2, 12
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 56
LDI r7, 318
LDI r8, 145
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 371
LDI r11, 148
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
