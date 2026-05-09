; DESCRIPTION: Composite: Renders a cyan line between points (319, 105) and (21, 211) then Places a black dot at position (49, 182).
; PLAN: r0=319(x1), r1=105(y1), r2=21(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=49(x), r6=182(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 319
LDI r1, 105
LDI r2, 21
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 182
LDI r7, 0x000000
PSET r5, r6, r7
HALT
