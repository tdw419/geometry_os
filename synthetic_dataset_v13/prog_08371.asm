; DESCRIPTION: Renders a green line between points (96, 212) and (501, 17).
; PLAN: r0=96(x1), r1=212(y1), r2=501(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 212
LDI r2, 501
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
