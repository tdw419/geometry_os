; DESCRIPTION: Composite: Sets a single magenta pixel at (35, 216) then Places a blue 26x30 rectangle at position (247, 18) then Renders a blue line between points (314, 10) and (87, 219).
; PLAN: r0=35(x), r1=216(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=247(x), r6=18(y), r7=26(width), r8=30(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=314(x1), r11=10(y1), r12=87(x2), r13=219(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 35
LDI r1, 216
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 247
LDI r6, 18
LDI r7, 26
LDI r8, 30
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 314
LDI r11, 10
LDI r12, 87
LDI r13, 219
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
