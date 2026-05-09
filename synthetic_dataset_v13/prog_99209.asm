; DESCRIPTION: Composite: Renders a orange disk with center (339, 99) and radius 25 then Draws a blue line from (441, 43) to (342, 133) then Places a cyan dot at position (484, 39).
; PLAN: r0=339(x), r1=99(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=441(x1), r6=43(y1), r7=342(x2), r8=133(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=484(x), r11=39(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 339
LDI r1, 99
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 441
LDI r6, 43
LDI r7, 342
LDI r8, 133
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 484
LDI r11, 39
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
