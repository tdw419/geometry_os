; DESCRIPTION: Composite: Places a green 102x73 rectangle at position (105, 10) then Sets a single yellow pixel at (204, 103) then Renders a yellow line between points (315, 201) and (38, 225).
; PLAN: r0=105(x), r1=10(y), r2=102(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=204(x), r6=103(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=315(x1), r11=201(y1), r12=38(x2), r13=225(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 105
LDI r1, 10
LDI r2, 102
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 103
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 315
LDI r11, 201
LDI r12, 38
LDI r13, 225
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
