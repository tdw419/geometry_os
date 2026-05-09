; DESCRIPTION: Renders a magenta line between points (160, 251) and (413, 18).
; PLAN: r0=160(x1), r1=251(y1), r2=413(x2), r3=18(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 251
LDI r2, 413
LDI r3, 18
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
