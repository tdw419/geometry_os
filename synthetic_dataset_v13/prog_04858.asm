; DESCRIPTION: Composite: Draws a white line from (402, 138) to (325, 243) then Places a purple dot at position (95, 52).
; PLAN: r0=402(x1), r1=138(y1), r2=325(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=95(x), r6=52(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 402
LDI r1, 138
LDI r2, 325
LDI r3, 243
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 52
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
