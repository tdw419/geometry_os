; DESCRIPTION: Composite: Places a purple 50x94 rectangle at position (217, 140) then Places a yellow dot at position (250, 29) then Creates a purple circular shape at (263, 180) with radius 34.
; PLAN: r0=217(x), r1=140(y), r2=50(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=250(x), r6=29(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=263(x), r11=180(y), r12=34(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 217
LDI r1, 140
LDI r2, 50
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 29
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 263
LDI r11, 180
LDI r12, 34
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
