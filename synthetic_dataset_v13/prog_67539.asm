; DESCRIPTION: Composite: Places a yellow dot at position (380, 125) then Draws a orange line from (266, 115) to (258, 95).
; PLAN: r0=380(x), r1=125(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=266(x1), r6=115(y1), r7=258(x2), r8=95(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 380
LDI r1, 125
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 266
LDI r6, 115
LDI r7, 258
LDI r8, 95
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
