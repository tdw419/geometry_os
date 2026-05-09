; DESCRIPTION: Composite: Places a cyan dot at position (75, 192) then Creates a cyan circular shape at (106, 95) with radius 53 then Renders a red line between points (252, 207) and (296, 136).
; PLAN: r0=75(x), r1=192(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=106(x), r6=95(y), r7=53(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=252(x1), r11=207(y1), r12=296(x2), r13=136(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 75
LDI r1, 192
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 106
LDI r6, 95
LDI r7, 53
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 252
LDI r11, 207
LDI r12, 296
LDI r13, 136
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
