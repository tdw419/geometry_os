; DESCRIPTION: Composite: Places a magenta dot at position (159, 3) then Draws a white rectangle at (42, 204) with width 108 and height 51 then Places a purple line segment connecting (193, 198) to (131, 162).
; PLAN: r0=159(x), r1=3(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=42(x), r6=204(y), r7=108(width), r8=51(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=193(x1), r11=198(y1), r12=131(x2), r13=162(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 159
LDI r1, 3
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 42
LDI r6, 204
LDI r7, 108
LDI r8, 51
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 193
LDI r11, 198
LDI r12, 131
LDI r13, 162
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
