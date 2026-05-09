; DESCRIPTION: Composite: Draws a green line from (84, 217) to (103, 197) then Places a purple dot at position (40, 15).
; PLAN: r0=84(x1), r1=217(y1), r2=103(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=40(x), r6=15(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 84
LDI r1, 217
LDI r2, 103
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 15
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
