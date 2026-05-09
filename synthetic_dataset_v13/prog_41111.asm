; DESCRIPTION: Composite: Places a yellow 52x105 rectangle at position (66, 87) then Places a purple dot at position (281, 160) then Draws a purple circle centered at (220, 177) with radius 14.
; PLAN: r0=66(x), r1=87(y), r2=52(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=281(x), r6=160(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=220(x), r11=177(y), r12=14(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 66
LDI r1, 87
LDI r2, 52
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 160
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 220
LDI r11, 177
LDI r12, 14
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
