; DESCRIPTION: Renders a yellow line between points (449, 7) and (367, 112).
; PLAN: r0=449(x1), r1=7(y1), r2=367(x2), r3=112(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 7
LDI r2, 367
LDI r3, 112
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
