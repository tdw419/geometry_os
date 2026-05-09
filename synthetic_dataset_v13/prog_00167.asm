; DESCRIPTION: Composite: Draws a orange line from (407, 25) to (98, 113) then Places a cyan dot at position (18, 87).
; PLAN: r0=407(x1), r1=25(y1), r2=98(x2), r3=113(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=18(x), r6=87(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 407
LDI r1, 25
LDI r2, 98
LDI r3, 113
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 87
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
