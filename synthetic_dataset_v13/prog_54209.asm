; DESCRIPTION: Composite: Places a green line segment connecting (330, 251) to (510, 18) then Places a green dot at position (448, 15).
; PLAN: r0=330(x1), r1=251(y1), r2=510(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=448(x), r6=15(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 330
LDI r1, 251
LDI r2, 510
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 448
LDI r6, 15
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
