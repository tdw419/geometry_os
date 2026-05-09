; DESCRIPTION: Composite: Draws a blue line from (99, 133) to (296, 29) then Creates a yellow circular shape at (71, 170) with radius 44 then Places a cyan dot at position (306, 95).
; PLAN: r0=99(x1), r1=133(y1), r2=296(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=170(y), r7=44(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=306(x), r11=95(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 99
LDI r1, 133
LDI r2, 296
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 170
LDI r7, 44
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 306
LDI r11, 95
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
