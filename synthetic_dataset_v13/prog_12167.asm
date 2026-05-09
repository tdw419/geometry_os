; DESCRIPTION: Renders a green line between points (33, 26) and (300, 191).
; PLAN: r0=33(x1), r1=26(y1), r2=300(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 26
LDI r2, 300
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
