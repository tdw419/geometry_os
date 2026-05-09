; DESCRIPTION: Draws a red line from (145, 14) to (191, 237).
; PLAN: r0=145(x1), r1=14(y1), r2=191(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 14
LDI r2, 191
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
