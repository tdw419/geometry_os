; DESCRIPTION: Renders a magenta line between points (112, 52) and (493, 214).
; PLAN: r0=112(x1), r1=52(y1), r2=493(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 52
LDI r2, 493
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
