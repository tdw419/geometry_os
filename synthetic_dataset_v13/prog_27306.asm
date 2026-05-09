; DESCRIPTION: Composite: Draws a green circle centered at (194, 86) with radius 59 then Draws a orange line from (441, 35) to (109, 230) then Places a red dot at position (426, 43).
; PLAN: r0=194(x), r1=86(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=441(x1), r6=35(y1), r7=109(x2), r8=230(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=426(x), r11=43(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 194
LDI r1, 86
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 441
LDI r6, 35
LDI r7, 109
LDI r8, 230
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 426
LDI r11, 43
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
