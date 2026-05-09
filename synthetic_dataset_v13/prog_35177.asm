; DESCRIPTION: Draws a green line from (407, 80) to (13, 208).
; PLAN: r0=407(x1), r1=80(y1), r2=13(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 80
LDI r2, 13
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
