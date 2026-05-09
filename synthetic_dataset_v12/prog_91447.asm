; DESCRIPTION: Renders a red line between points (1, 51) and (160, 45).
; PLAN: r0=1(x1), r1=51(y1), r2=160(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 51
LDI r2, 160
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
