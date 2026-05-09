; DESCRIPTION: Composite: Draws a white line from (241, 0) to (81, 25) then Sets a single cyan pixel at (466, 156).
; PLAN: r0=241(x1), r1=0(y1), r2=81(x2), r3=25(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=466(x), r6=156(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 241
LDI r1, 0
LDI r2, 81
LDI r3, 25
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 156
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
