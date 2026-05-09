; DESCRIPTION: Composite: Places a yellow dot at position (96, 14) then Renders a red line between points (298, 155) and (189, 14) then Renders a purple box of size 68x62 starting at (442, 55).
; PLAN: r0=96(x), r1=14(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=298(x1), r6=155(y1), r7=189(x2), r8=14(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=442(x), r11=55(y), r12=68(width), r13=62(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 96
LDI r1, 14
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 298
LDI r6, 155
LDI r7, 189
LDI r8, 14
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 442
LDI r11, 55
LDI r12, 68
LDI r13, 62
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
