; DESCRIPTION: Renders a green line between points (134, 231) and (122, 11).
; PLAN: r0=134(x1), r1=231(y1), r2=122(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 231
LDI r2, 122
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
