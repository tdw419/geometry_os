; DESCRIPTION: Draws a red line from (46, 234) to (159, 99).
; PLAN: r0=46(x1), r1=234(y1), r2=159(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 234
LDI r2, 159
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
