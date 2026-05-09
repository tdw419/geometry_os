; DESCRIPTION: Draws a red line from (225, 98) to (51, 205).
; PLAN: r0=225(x1), r1=98(y1), r2=51(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 98
LDI r2, 51
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
