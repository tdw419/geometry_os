; DESCRIPTION: Draws a orange line from (365, 253) to (177, 5).
; PLAN: r0=365(x1), r1=253(y1), r2=177(x2), r3=5(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 253
LDI r2, 177
LDI r3, 5
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
