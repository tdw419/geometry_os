; DESCRIPTION: Composite: Renders a green line between points (51, 144) and (439, 165) then Draws a green circle centered at (94, 109) with radius 45 then Places a green 70x68 rectangle at position (119, 143).
; PLAN: r0=51(x1), r1=144(y1), r2=439(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=94(x), r6=109(y), r7=45(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=119(x), r11=143(y), r12=70(width), r13=68(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 51
LDI r1, 144
LDI r2, 439
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 109
LDI r7, 45
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 119
LDI r11, 143
LDI r12, 70
LDI r13, 68
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
