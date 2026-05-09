; DESCRIPTION: Draws a red line from (52, 112) to (330, 140).
; PLAN: r0=52(x1), r1=112(y1), r2=330(x2), r3=140(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 112
LDI r2, 330
LDI r3, 140
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
