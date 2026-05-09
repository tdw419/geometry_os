; DESCRIPTION: Composite: Places a purple 87x93 rectangle at position (279, 8) then Renders a red line between points (191, 102) and (450, 199) then Places a blue circle of radius 32 at center (424, 34).
; PLAN: r0=279(x), r1=8(y), r2=87(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=191(x1), r6=102(y1), r7=450(x2), r8=199(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=424(x), r11=34(y), r12=32(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 279
LDI r1, 8
LDI r2, 87
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 102
LDI r7, 450
LDI r8, 199
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 424
LDI r11, 34
LDI r12, 32
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
