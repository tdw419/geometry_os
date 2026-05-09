; DESCRIPTION: Draws a green line from (494, 80) to (427, 218).
; PLAN: r0=494(x1), r1=80(y1), r2=427(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 80
LDI r2, 427
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
