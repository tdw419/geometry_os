; DESCRIPTION: Draws a red line from (243, 142) to (358, 234).
; PLAN: r0=243(x1), r1=142(y1), r2=358(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 142
LDI r2, 358
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
