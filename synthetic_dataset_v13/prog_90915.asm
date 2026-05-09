; DESCRIPTION: Renders a green line between points (408, 145) and (112, 37).
; PLAN: r0=408(x1), r1=145(y1), r2=112(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 145
LDI r2, 112
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
