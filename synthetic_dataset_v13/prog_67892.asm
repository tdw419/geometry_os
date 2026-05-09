; DESCRIPTION: Composite: Creates a white circular shape at (204, 81) with radius 56 then Places a green dot at position (87, 190) then Draws a yellow line from (489, 126) to (31, 159).
; PLAN: r0=204(x), r1=81(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x), r6=190(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=489(x1), r11=126(y1), r12=31(x2), r13=159(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 204
LDI r1, 81
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 190
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 489
LDI r11, 126
LDI r12, 31
LDI r13, 159
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
