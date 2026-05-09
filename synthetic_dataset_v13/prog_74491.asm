; DESCRIPTION: Draws a red line from (510, 11) to (471, 26).
; PLAN: r0=510(x1), r1=11(y1), r2=471(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 11
LDI r2, 471
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
