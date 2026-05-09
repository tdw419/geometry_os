; DESCRIPTION: Composite: Draws a yellow line from (232, 244) to (8, 254) then Places a purple dot at position (505, 222).
; PLAN: r0=232(x1), r1=244(y1), r2=8(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=505(x), r6=222(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 232
LDI r1, 244
LDI r2, 8
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 505
LDI r6, 222
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
