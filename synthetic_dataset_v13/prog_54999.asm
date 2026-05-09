; DESCRIPTION: Draws a green line from (230, 119) to (358, 225).
; PLAN: r0=230(x1), r1=119(y1), r2=358(x2), r3=225(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 119
LDI r2, 358
LDI r3, 225
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
