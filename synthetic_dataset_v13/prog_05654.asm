; DESCRIPTION: Draws a green line from (13, 250) to (466, 4).
; PLAN: r0=13(x1), r1=250(y1), r2=466(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 250
LDI r2, 466
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
