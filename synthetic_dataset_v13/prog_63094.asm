; DESCRIPTION: Draws a green line from (400, 233) to (358, 18).
; PLAN: r0=400(x1), r1=233(y1), r2=358(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 233
LDI r2, 358
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
