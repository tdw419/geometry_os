; DESCRIPTION: Composite: Renders a orange line between points (463, 19) and (105, 188) then Places a cyan dot at position (221, 73).
; PLAN: r0=463(x1), r1=19(y1), r2=105(x2), r3=188(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=221(x), r6=73(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 463
LDI r1, 19
LDI r2, 105
LDI r3, 188
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 73
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
