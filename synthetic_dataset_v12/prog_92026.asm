; DESCRIPTION: Composite: Draws a yellow line from (236, 191) to (127, 195) then Renders a yellow disk with center (131, 123) and radius 55 then Places a yellow 79x79 rectangle at position (104, 75).
; PLAN: r0=236(x1), r1=191(y1), r2=127(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=131(x), r6=123(y), r7=55(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=104(x), r11=75(y), r12=79(width), r13=79(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 236
LDI r1, 191
LDI r2, 127
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 123
LDI r7, 55
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 104
LDI r11, 75
LDI r12, 79
LDI r13, 79
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
