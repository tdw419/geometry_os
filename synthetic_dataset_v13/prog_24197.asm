; DESCRIPTION: Composite: Places a blue dot at position (10, 254) then Renders a black line between points (283, 3) and (96, 21) then Places a blue 98x118 rectangle at position (360, 48).
; PLAN: r0=10(x), r1=254(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=283(x1), r6=3(y1), r7=96(x2), r8=21(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=360(x), r11=48(y), r12=98(width), r13=118(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 10
LDI r1, 254
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 283
LDI r6, 3
LDI r7, 96
LDI r8, 21
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 48
LDI r12, 98
LDI r13, 118
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
