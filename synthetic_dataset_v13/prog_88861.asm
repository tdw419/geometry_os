; DESCRIPTION: Composite: Renders a cyan line between points (316, 86) and (89, 8) then Places a red dot at position (329, 26).
; PLAN: r0=316(x1), r1=86(y1), r2=89(x2), r3=8(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=329(x), r6=26(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 316
LDI r1, 86
LDI r2, 89
LDI r3, 8
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 26
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
