; DESCRIPTION: Composite: Places a white dot at position (289, 36) then Draws a orange line from (295, 94) to (51, 250).
; PLAN: r0=289(x), r1=36(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=295(x1), r6=94(y1), r7=51(x2), r8=250(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 289
LDI r1, 36
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 295
LDI r6, 94
LDI r7, 51
LDI r8, 250
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
