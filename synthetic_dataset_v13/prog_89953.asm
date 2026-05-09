; DESCRIPTION: Renders a magenta line between points (492, 77) and (11, 6).
; PLAN: r0=492(x1), r1=77(y1), r2=11(x2), r3=6(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 77
LDI r2, 11
LDI r3, 6
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
