; DESCRIPTION: Renders a green line between points (4, 25) and (325, 91).
; PLAN: r0=4(x1), r1=25(y1), r2=325(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 25
LDI r2, 325
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
