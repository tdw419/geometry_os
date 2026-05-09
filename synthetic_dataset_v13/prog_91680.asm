; DESCRIPTION: Composite: Renders a purple disk with center (423, 97) and radius 63 then Renders a black box of size 77x37 starting at (257, 38) then Renders a black line between points (422, 229) and (412, 172).
; PLAN: r0=423(x), r1=97(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=257(x), r6=38(y), r7=77(width), r8=37(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=422(x1), r11=229(y1), r12=412(x2), r13=172(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 423
LDI r1, 97
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 257
LDI r6, 38
LDI r7, 77
LDI r8, 37
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 422
LDI r11, 229
LDI r12, 412
LDI r13, 172
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
