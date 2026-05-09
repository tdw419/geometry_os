; DESCRIPTION: Composite: Draws a blue line from (358, 97) to (86, 144) then Places a purple dot at position (240, 49).
; PLAN: r0=358(x1), r1=97(y1), r2=86(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=240(x), r6=49(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 358
LDI r1, 97
LDI r2, 86
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 49
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
