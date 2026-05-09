; DESCRIPTION: Renders a magenta line between points (20, 4) and (332, 124).
; PLAN: r0=20(x1), r1=4(y1), r2=332(x2), r3=124(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 4
LDI r2, 332
LDI r3, 124
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
