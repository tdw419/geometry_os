; DESCRIPTION: Draws a green line from (54, 80) to (505, 238).
; PLAN: r0=54(x1), r1=80(y1), r2=505(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 80
LDI r2, 505
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
