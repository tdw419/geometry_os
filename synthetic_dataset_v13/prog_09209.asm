; DESCRIPTION: Renders a magenta line between points (413, 1) and (507, 51).
; PLAN: r0=413(x1), r1=1(y1), r2=507(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 1
LDI r2, 507
LDI r3, 51
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
