; DESCRIPTION: Draws a yellow line from (47, 219) to (358, 243).
; PLAN: r0=47(x1), r1=219(y1), r2=358(x2), r3=243(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 219
LDI r2, 358
LDI r3, 243
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
