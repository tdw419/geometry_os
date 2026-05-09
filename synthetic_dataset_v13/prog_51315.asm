; DESCRIPTION: Composite: Sets a single red pixel at (367, 118) then Renders a blue line between points (507, 117) and (40, 114) then Places a white 96x23 rectangle at position (112, 181).
; PLAN: r0=367(x), r1=118(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=507(x1), r6=117(y1), r7=40(x2), r8=114(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=112(x), r11=181(y), r12=96(width), r13=23(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 367
LDI r1, 118
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 507
LDI r6, 117
LDI r7, 40
LDI r8, 114
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 112
LDI r11, 181
LDI r12, 96
LDI r13, 23
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
