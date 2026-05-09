; DESCRIPTION: Composite: Draws a red line from (238, 192) to (178, 188) then Places a orange dot at position (22, 83).
; PLAN: r0=238(x1), r1=192(y1), r2=178(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=22(x), r6=83(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 238
LDI r1, 192
LDI r2, 178
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 22
LDI r6, 83
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
