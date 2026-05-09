; DESCRIPTION: Composite: Renders a blue disk with center (32, 193) and radius 18 then Places a red 30x112 rectangle at position (453, 107) then Draws a red line from (476, 4) to (94, 4).
; PLAN: r0=32(x), r1=193(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=453(x), r6=107(y), r7=30(width), r8=112(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=476(x1), r11=4(y1), r12=94(x2), r13=4(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 32
LDI r1, 193
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 453
LDI r6, 107
LDI r7, 30
LDI r8, 112
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 476
LDI r11, 4
LDI r12, 94
LDI r13, 4
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
