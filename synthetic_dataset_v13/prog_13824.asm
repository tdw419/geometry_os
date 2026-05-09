; DESCRIPTION: Composite: Places a orange line segment connecting (452, 159) to (383, 176) then Renders a yellow disk with center (393, 151) and radius 67 then Places a purple dot at position (381, 250).
; PLAN: r0=452(x1), r1=159(y1), r2=383(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=393(x), r6=151(y), r7=67(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=381(x), r11=250(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 452
LDI r1, 159
LDI r2, 383
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 151
LDI r7, 67
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 381
LDI r11, 250
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
