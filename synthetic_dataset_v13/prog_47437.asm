; DESCRIPTION: Draws a blue line from (171, 133) to (265, 112).
; PLAN: r0=171(x1), r1=133(y1), r2=265(x2), r3=112(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 133
LDI r2, 265
LDI r3, 112
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
