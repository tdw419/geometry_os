; DESCRIPTION: Composite: Creates a green circular shape at (131, 89) with radius 40 then Renders a blue line between points (283, 32) and (511, 61) then Places a black 87x104 rectangle at position (216, 112).
; PLAN: r0=131(x), r1=89(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=283(x1), r6=32(y1), r7=511(x2), r8=61(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=216(x), r11=112(y), r12=87(width), r13=104(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 131
LDI r1, 89
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 283
LDI r6, 32
LDI r7, 511
LDI r8, 61
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 216
LDI r11, 112
LDI r12, 87
LDI r13, 104
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
