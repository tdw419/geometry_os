; DESCRIPTION: Draws a green line from (129, 234) to (413, 137).
; PLAN: r0=129(x1), r1=234(y1), r2=413(x2), r3=137(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 234
LDI r2, 413
LDI r3, 137
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
