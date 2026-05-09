; DESCRIPTION: Renders a green line between points (141, 81) and (71, 5).
; PLAN: r0=141(x1), r1=81(y1), r2=71(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 81
LDI r2, 71
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
