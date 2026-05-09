; DESCRIPTION: Draws a green line from (172, 252) to (371, 191).
; PLAN: r0=172(x1), r1=252(y1), r2=371(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 252
LDI r2, 371
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
