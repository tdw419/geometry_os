; DESCRIPTION: Composite: Draws a red line from (431, 217) to (386, 82) then Places a orange dot at position (13, 219).
; PLAN: r0=431(x1), r1=217(y1), r2=386(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=13(x), r6=219(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 431
LDI r1, 217
LDI r2, 386
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 13
LDI r6, 219
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
