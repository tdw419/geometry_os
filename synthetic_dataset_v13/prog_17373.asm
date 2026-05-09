; DESCRIPTION: Composite: Draws a orange line from (511, 4) to (374, 132) then Places a black dot at position (433, 1).
; PLAN: r0=511(x1), r1=4(y1), r2=374(x2), r3=132(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=433(x), r6=1(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 511
LDI r1, 4
LDI r2, 374
LDI r3, 132
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 1
LDI r7, 0x000000
PSET r5, r6, r7
HALT
