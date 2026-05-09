; DESCRIPTION: Composite: Renders a yellow line between points (97, 118) and (319, 56) then Places a cyan dot at position (344, 255).
; PLAN: r0=97(x1), r1=118(y1), r2=319(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=344(x), r6=255(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 97
LDI r1, 118
LDI r2, 319
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 255
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
