; DESCRIPTION: Renders a magenta line between points (237, 77) and (421, 162).
; PLAN: r0=237(x1), r1=77(y1), r2=421(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 77
LDI r2, 421
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
