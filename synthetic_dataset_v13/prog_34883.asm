; DESCRIPTION: Renders a green line between points (391, 214) and (81, 112).
; PLAN: r0=391(x1), r1=214(y1), r2=81(x2), r3=112(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 214
LDI r2, 81
LDI r3, 112
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
