; DESCRIPTION: Composite: Draws a purple line from (84, 21) to (153, 62) then Places a yellow dot at position (175, 57).
; PLAN: r0=84(x1), r1=21(y1), r2=153(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=175(x), r6=57(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 84
LDI r1, 21
LDI r2, 153
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 57
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
