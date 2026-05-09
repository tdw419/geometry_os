; DESCRIPTION: Renders a green line between points (185, 227) and (90, 231).
; PLAN: r0=185(x1), r1=227(y1), r2=90(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 227
LDI r2, 90
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
