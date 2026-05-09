; DESCRIPTION: Renders a green line between points (151, 212) and (371, 34).
; PLAN: r0=151(x1), r1=212(y1), r2=371(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 212
LDI r2, 371
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
