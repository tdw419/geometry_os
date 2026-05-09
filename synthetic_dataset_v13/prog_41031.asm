; DESCRIPTION: Composite: Places a red line segment connecting (453, 57) to (43, 11) then Places a white dot at position (122, 79).
; PLAN: r0=453(x1), r1=57(y1), r2=43(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=122(x), r6=79(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 453
LDI r1, 57
LDI r2, 43
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 79
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
