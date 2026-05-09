; DESCRIPTION: Composite: Places a yellow circle of radius 29 at center (381, 75) then Draws a black line from (291, 193) to (412, 213) then Places a red dot at position (319, 9).
; PLAN: r0=381(x), r1=75(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=291(x1), r6=193(y1), r7=412(x2), r8=213(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=319(x), r11=9(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 381
LDI r1, 75
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 291
LDI r6, 193
LDI r7, 412
LDI r8, 213
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 319
LDI r11, 9
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
