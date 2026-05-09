; DESCRIPTION: Composite: Draws a orange line from (271, 39) to (26, 88) then Places a purple dot at position (115, 25).
; PLAN: r0=271(x1), r1=39(y1), r2=26(x2), r3=88(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=25(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 271
LDI r1, 39
LDI r2, 26
LDI r3, 88
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 25
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
