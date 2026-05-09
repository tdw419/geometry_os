; DESCRIPTION: Composite: Draws a white line from (471, 121) to (203, 81) then Sets a single cyan pixel at (277, 106).
; PLAN: r0=471(x1), r1=121(y1), r2=203(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=277(x), r6=106(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 471
LDI r1, 121
LDI r2, 203
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 106
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
