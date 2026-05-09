; DESCRIPTION: Composite: Draws a orange line from (319, 127) to (134, 239) then Places a black dot at position (370, 131).
; PLAN: r0=319(x1), r1=127(y1), r2=134(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=370(x), r6=131(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 319
LDI r1, 127
LDI r2, 134
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 131
LDI r7, 0x000000
PSET r5, r6, r7
HALT
