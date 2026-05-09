; DESCRIPTION: Renders a green line between points (234, 180) and (250, 110).
; PLAN: r0=234(x1), r1=180(y1), r2=250(x2), r3=110(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 180
LDI r2, 250
LDI r3, 110
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
