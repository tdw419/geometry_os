; DESCRIPTION: Composite: Places a red 21x44 rectangle at position (461, 88) then Renders a blue disk with center (211, 207) and radius 28 then Draws a magenta line from (119, 65) to (266, 160).
; PLAN: r0=461(x), r1=88(y), r2=21(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=211(x), r6=207(y), r7=28(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=119(x1), r11=65(y1), r12=266(x2), r13=160(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 461
LDI r1, 88
LDI r2, 21
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 207
LDI r7, 28
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 119
LDI r11, 65
LDI r12, 266
LDI r13, 160
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
