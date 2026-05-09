; DESCRIPTION: Composite: Draws a cyan line from (140, 62) to (431, 133) then Sets a single black pixel at (383, 225) then Renders a cyan disk with center (339, 232) and radius 24.
; PLAN: r0=140(x1), r1=62(y1), r2=431(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=383(x), r6=225(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=339(x), r11=232(y), r12=24(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 140
LDI r1, 62
LDI r2, 431
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 225
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 339
LDI r11, 232
LDI r12, 24
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
