; DESCRIPTION: Composite: Places a yellow line segment connecting (390, 45) to (338, 169) then Places a red dot at position (416, 93).
; PLAN: r0=390(x1), r1=45(y1), r2=338(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=416(x), r6=93(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 390
LDI r1, 45
LDI r2, 338
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 93
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
