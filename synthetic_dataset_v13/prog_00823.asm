; DESCRIPTION: Composite: Draws a white line from (45, 174) to (27, 252) then Places a purple dot at position (270, 95).
; PLAN: r0=45(x1), r1=174(y1), r2=27(x2), r3=252(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=95(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 45
LDI r1, 174
LDI r2, 27
LDI r3, 252
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 95
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
