; DESCRIPTION: Draws a red line from (51, 195) to (69, 208).
; PLAN: r0=51(x1), r1=195(y1), r2=69(x2), r3=208(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 195
LDI r2, 69
LDI r3, 208
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
