; DESCRIPTION: Renders a green line between points (326, 250) and (195, 46).
; PLAN: r0=326(x1), r1=250(y1), r2=195(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 250
LDI r2, 195
LDI r3, 46
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
