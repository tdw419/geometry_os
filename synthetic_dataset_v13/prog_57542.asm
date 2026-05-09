; DESCRIPTION: Composite: Draws a purple line from (147, 33) to (257, 132) then Places a cyan 74x65 rectangle at position (104, 37) then Places a purple dot at position (191, 110).
; PLAN: r0=147(x1), r1=33(y1), r2=257(x2), r3=132(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=104(x), r6=37(y), r7=74(width), r8=65(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=191(x), r11=110(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 147
LDI r1, 33
LDI r2, 257
LDI r3, 132
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 37
LDI r7, 74
LDI r8, 65
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 191
LDI r11, 110
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
