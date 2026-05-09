; DESCRIPTION: Composite: Places a yellow 93x74 rectangle at position (296, 79) then Places a yellow line segment connecting (33, 149) to (322, 169) then Places a red circle of radius 72 at center (79, 166).
; PLAN: r0=296(x), r1=79(y), r2=93(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=33(x1), r6=149(y1), r7=322(x2), r8=169(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=79(x), r11=166(y), r12=72(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 296
LDI r1, 79
LDI r2, 93
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 149
LDI r7, 322
LDI r8, 169
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 79
LDI r11, 166
LDI r12, 72
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
