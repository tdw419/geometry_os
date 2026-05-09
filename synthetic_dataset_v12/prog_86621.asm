; DESCRIPTION: Composite: Draws a orange line from (436, 130) to (469, 241) then Places a magenta dot at position (79, 145).
; PLAN: r0=436(x1), r1=130(y1), r2=469(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=79(x), r6=145(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 436
LDI r1, 130
LDI r2, 469
LDI r3, 241
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 145
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
