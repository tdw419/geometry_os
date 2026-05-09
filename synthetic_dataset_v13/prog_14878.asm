; DESCRIPTION: Draws a orange line from (275, 235) to (393, 241).
; PLAN: r0=275(x1), r1=235(y1), r2=393(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 235
LDI r2, 393
LDI r3, 241
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
