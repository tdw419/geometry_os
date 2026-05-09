; DESCRIPTION: Composite: Renders a green disk with center (464, 175) and radius 29 then Draws a orange line from (417, 158) to (382, 150) then Places a red dot at position (132, 69).
; PLAN: r0=464(x), r1=175(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=417(x1), r6=158(y1), r7=382(x2), r8=150(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=132(x), r11=69(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 464
LDI r1, 175
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 417
LDI r6, 158
LDI r7, 382
LDI r8, 150
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 132
LDI r11, 69
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
