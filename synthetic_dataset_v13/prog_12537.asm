; DESCRIPTION: Composite: Sets a single cyan pixel at (25, 187) then Draws a black line from (424, 17) to (125, 74).
; PLAN: r0=25(x), r1=187(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=424(x1), r6=17(y1), r7=125(x2), r8=74(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 25
LDI r1, 187
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 424
LDI r6, 17
LDI r7, 125
LDI r8, 74
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
