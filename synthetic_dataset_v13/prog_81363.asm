; DESCRIPTION: Composite: Places a blue line segment connecting (220, 89) to (218, 147) then Places a green circle of radius 12 at center (467, 151) then Draws a red rectangle at (32, 112) with width 100 and height 120.
; PLAN: r0=220(x1), r1=89(y1), r2=218(x2), r3=147(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=467(x), r6=151(y), r7=12(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=32(x), r11=112(y), r12=100(width), r13=120(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 220
LDI r1, 89
LDI r2, 218
LDI r3, 147
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 151
LDI r7, 12
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 32
LDI r11, 112
LDI r12, 100
LDI r13, 120
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
