; DESCRIPTION: Composite: Renders a purple disk with center (94, 90) and radius 26 then Draws a white line from (509, 194) to (58, 88) then Places a yellow 112x60 rectangle at position (234, 71).
; PLAN: r0=94(x), r1=90(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=509(x1), r6=194(y1), r7=58(x2), r8=88(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=234(x), r11=71(y), r12=112(width), r13=60(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 94
LDI r1, 90
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 509
LDI r6, 194
LDI r7, 58
LDI r8, 88
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 234
LDI r11, 71
LDI r12, 112
LDI r13, 60
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
