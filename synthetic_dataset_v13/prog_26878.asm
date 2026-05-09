; DESCRIPTION: Composite: Draws a cyan line from (465, 96) to (81, 226) then Places a purple dot at position (24, 66) then Creates a black circular shape at (107, 224) with radius 31.
; PLAN: r0=465(x1), r1=96(y1), r2=81(x2), r3=226(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=24(x), r6=66(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=107(x), r11=224(y), r12=31(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 465
LDI r1, 96
LDI r2, 81
LDI r3, 226
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 66
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 107
LDI r11, 224
LDI r12, 31
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
