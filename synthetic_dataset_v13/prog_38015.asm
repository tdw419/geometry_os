; DESCRIPTION: Draws a green line from (503, 227) to (210, 239).
; PLAN: r0=503(x1), r1=227(y1), r2=210(x2), r3=239(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 227
LDI r2, 210
LDI r3, 239
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
