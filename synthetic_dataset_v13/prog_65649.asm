; DESCRIPTION: Composite: Creates a black circular shape at (66, 140) with radius 35 then Draws a cyan line from (317, 190) to (52, 160) then Places a purple dot at position (489, 137).
; PLAN: r0=66(x), r1=140(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=317(x1), r6=190(y1), r7=52(x2), r8=160(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=489(x), r11=137(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 66
LDI r1, 140
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 317
LDI r6, 190
LDI r7, 52
LDI r8, 160
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 489
LDI r11, 137
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
