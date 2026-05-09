; DESCRIPTION: Renders a green line between points (101, 112) and (182, 58).
; PLAN: r0=101(x1), r1=112(y1), r2=182(x2), r3=58(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 112
LDI r2, 182
LDI r3, 58
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
