; DESCRIPTION: Renders a green line between points (324, 103) and (365, 147).
; PLAN: r0=324(x1), r1=103(y1), r2=365(x2), r3=147(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 103
LDI r2, 365
LDI r3, 147
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
