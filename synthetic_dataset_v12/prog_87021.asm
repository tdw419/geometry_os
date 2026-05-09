; DESCRIPTION: Composite: Renders a purple line between points (36, 83) and (257, 206) then Places a blue 64x58 rectangle at position (229, 43) then Places a yellow dot at position (174, 92).
; PLAN: r0=36(x1), r1=83(y1), r2=257(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=229(x), r6=43(y), r7=64(width), r8=58(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=174(x), r11=92(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 36
LDI r1, 83
LDI r2, 257
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 43
LDI r7, 64
LDI r8, 58
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 174
LDI r11, 92
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
