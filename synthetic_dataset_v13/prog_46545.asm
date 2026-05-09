; DESCRIPTION: Composite: Places a red line segment connecting (268, 51) to (409, 209) then Places a orange dot at position (121, 99).
; PLAN: r0=268(x1), r1=51(y1), r2=409(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=121(x), r6=99(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 268
LDI r1, 51
LDI r2, 409
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 99
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
