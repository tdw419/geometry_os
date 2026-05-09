; DESCRIPTION: Composite: Places a blue 81x53 rectangle at position (189, 44) then Renders a green line between points (342, 173) and (109, 134) then Sets a single black pixel at (418, 106).
; PLAN: r0=189(x), r1=44(y), r2=81(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=342(x1), r6=173(y1), r7=109(x2), r8=134(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=418(x), r11=106(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 189
LDI r1, 44
LDI r2, 81
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 173
LDI r7, 109
LDI r8, 134
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 418
LDI r11, 106
LDI r12, 0x000000
PSET r10, r11, r12
HALT
