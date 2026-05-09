; DESCRIPTION: Renders a green line between points (350, 98) and (385, 80).
; PLAN: r0=350(x1), r1=98(y1), r2=385(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 98
LDI r2, 385
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
