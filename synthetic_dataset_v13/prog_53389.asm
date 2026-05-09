; DESCRIPTION: Composite: Draws a blue line from (190, 116) to (422, 201) then Places a green dot at position (282, 165) then Draws a white rectangle at (14, 6) with width 37 and height 93.
; PLAN: r0=190(x1), r1=116(y1), r2=422(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=165(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=14(x), r11=6(y), r12=37(width), r13=93(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 190
LDI r1, 116
LDI r2, 422
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 165
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 14
LDI r11, 6
LDI r12, 37
LDI r13, 93
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
