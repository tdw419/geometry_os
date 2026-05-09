; DESCRIPTION: Draws a green line from (71, 84) to (78, 158).
; PLAN: r0=71(x1), r1=84(y1), r2=78(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 84
LDI r2, 78
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
