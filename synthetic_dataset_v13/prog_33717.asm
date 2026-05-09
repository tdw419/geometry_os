; DESCRIPTION: Composite: Sets a single red pixel at (201, 142) then Places a red 24x102 rectangle at position (195, 82) then Places a orange line segment connecting (55, 204) to (297, 208).
; PLAN: r0=201(x), r1=142(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=195(x), r6=82(y), r7=24(width), r8=102(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=55(x1), r11=204(y1), r12=297(x2), r13=208(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 201
LDI r1, 142
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 195
LDI r6, 82
LDI r7, 24
LDI r8, 102
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 55
LDI r11, 204
LDI r12, 297
LDI r13, 208
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
