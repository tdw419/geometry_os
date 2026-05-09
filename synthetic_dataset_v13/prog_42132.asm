; DESCRIPTION: Composite: Renders a red line between points (276, 91) and (427, 192) then Places a black dot at position (213, 166).
; PLAN: r0=276(x1), r1=91(y1), r2=427(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=213(x), r6=166(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 276
LDI r1, 91
LDI r2, 427
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 166
LDI r7, 0x000000
PSET r5, r6, r7
HALT
