; DESCRIPTION: Draws a orange line from (177, 202) to (210, 176).
; PLAN: r0=177(x1), r1=202(y1), r2=210(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 202
LDI r2, 210
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
