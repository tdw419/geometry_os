; DESCRIPTION: Composite: Draws a orange line from (437, 53) to (338, 176) then Places a purple dot at position (15, 210).
; PLAN: r0=437(x1), r1=53(y1), r2=338(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=15(x), r6=210(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 437
LDI r1, 53
LDI r2, 338
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 15
LDI r6, 210
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
