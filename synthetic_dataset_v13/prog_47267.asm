; DESCRIPTION: Renders a green line between points (215, 150) and (453, 85).
; PLAN: r0=215(x1), r1=150(y1), r2=453(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 150
LDI r2, 453
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
