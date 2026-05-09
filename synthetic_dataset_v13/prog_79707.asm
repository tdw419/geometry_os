; DESCRIPTION: Draws a red line from (87, 142) to (432, 177).
; PLAN: r0=87(x1), r1=142(y1), r2=432(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 142
LDI r2, 432
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
