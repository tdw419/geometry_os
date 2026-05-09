; DESCRIPTION: Composite: Draws a blue circle centered at (128, 143) with radius 75 then Places a green 112x18 rectangle at position (15, 189) then Renders a green line between points (50, 71) and (468, 104).
; PLAN: r0=128(x), r1=143(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=15(x), r6=189(y), r7=112(width), r8=18(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=50(x1), r11=71(y1), r12=468(x2), r13=104(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 128
LDI r1, 143
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 15
LDI r6, 189
LDI r7, 112
LDI r8, 18
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 50
LDI r11, 71
LDI r12, 468
LDI r13, 104
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
