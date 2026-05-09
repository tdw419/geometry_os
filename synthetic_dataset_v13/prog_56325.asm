; DESCRIPTION: Composite: Draws a orange line from (23, 6) to (25, 204) then Places a white dot at position (118, 166).
; PLAN: r0=23(x1), r1=6(y1), r2=25(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=118(x), r6=166(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 23
LDI r1, 6
LDI r2, 25
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 166
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
