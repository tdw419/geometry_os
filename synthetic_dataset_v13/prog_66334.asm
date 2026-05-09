; DESCRIPTION: Composite: Draws a orange line from (279, 136) to (296, 249) then Places a cyan dot at position (166, 251).
; PLAN: r0=279(x1), r1=136(y1), r2=296(x2), r3=249(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=166(x), r6=251(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 279
LDI r1, 136
LDI r2, 296
LDI r3, 249
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 251
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
