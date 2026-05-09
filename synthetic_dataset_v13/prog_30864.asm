; DESCRIPTION: Draws a green line from (423, 240) to (483, 11).
; PLAN: r0=423(x1), r1=240(y1), r2=483(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 240
LDI r2, 483
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
