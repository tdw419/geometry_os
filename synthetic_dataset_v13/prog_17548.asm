; DESCRIPTION: Renders a green line between points (438, 106) and (450, 18).
; PLAN: r0=438(x1), r1=106(y1), r2=450(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 106
LDI r2, 450
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
