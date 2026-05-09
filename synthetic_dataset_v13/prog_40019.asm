; DESCRIPTION: Composite: Places a orange dot at position (235, 246) then Draws a white line from (133, 181) to (419, 210).
; PLAN: r0=235(x), r1=246(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=133(x1), r6=181(y1), r7=419(x2), r8=210(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 235
LDI r1, 246
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 133
LDI r6, 181
LDI r7, 419
LDI r8, 210
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
