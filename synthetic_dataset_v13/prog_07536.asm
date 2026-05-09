; DESCRIPTION: Composite: Renders a cyan line between points (396, 50) and (322, 147) then Places a magenta 50x33 rectangle at position (201, 101) then Creates a red circular shape at (156, 75) with radius 64.
; PLAN: r0=396(x1), r1=50(y1), r2=322(x2), r3=147(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=201(x), r6=101(y), r7=50(width), r8=33(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=156(x), r11=75(y), r12=64(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 396
LDI r1, 50
LDI r2, 322
LDI r3, 147
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 101
LDI r7, 50
LDI r8, 33
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 156
LDI r11, 75
LDI r12, 64
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
