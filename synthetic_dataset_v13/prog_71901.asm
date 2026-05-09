; DESCRIPTION: Composite: Places a blue dot at position (270, 153) then Renders a black box of size 38x93 starting at (89, 2) then Renders a green line between points (165, 216) and (198, 233).
; PLAN: r0=270(x), r1=153(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=89(x), r6=2(y), r7=38(width), r8=93(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=165(x1), r11=216(y1), r12=198(x2), r13=233(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 270
LDI r1, 153
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 89
LDI r6, 2
LDI r7, 38
LDI r8, 93
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 165
LDI r11, 216
LDI r12, 198
LDI r13, 233
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
