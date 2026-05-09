; DESCRIPTION: Composite: Draws a red line from (504, 181) to (180, 62) then Draws a blue circle centered at (496, 109) with radius 16.
; PLAN: r0=504(x1), r1=181(y1), r2=180(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=496(x), r6=109(y), r7=16(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 504
LDI r1, 181
LDI r2, 180
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 496
LDI r6, 109
LDI r7, 16
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
