; DESCRIPTION: Draws a green line from (503, 176) to (500, 17).
; PLAN: r0=503(x1), r1=176(y1), r2=500(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 176
LDI r2, 500
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
