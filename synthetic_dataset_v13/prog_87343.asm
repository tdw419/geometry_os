; DESCRIPTION: Draws a green line from (379, 219) to (396, 50).
; PLAN: r0=379(x1), r1=219(y1), r2=396(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 219
LDI r2, 396
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
