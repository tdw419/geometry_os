; DESCRIPTION: Renders a magenta line between points (482, 112) and (98, 4).
; PLAN: r0=482(x1), r1=112(y1), r2=98(x2), r3=4(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 112
LDI r2, 98
LDI r3, 4
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
