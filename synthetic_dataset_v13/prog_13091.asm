; DESCRIPTION: Composite: Places a red dot at position (269, 29) then Renders a purple box of size 93x37 starting at (346, 89) then Renders a black line between points (2, 233) and (232, 80).
; PLAN: r0=269(x), r1=29(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=346(x), r6=89(y), r7=93(width), r8=37(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=2(x1), r11=233(y1), r12=232(x2), r13=80(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 269
LDI r1, 29
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 346
LDI r6, 89
LDI r7, 93
LDI r8, 37
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 2
LDI r11, 233
LDI r12, 232
LDI r13, 80
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
