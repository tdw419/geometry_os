; DESCRIPTION: Renders a green line between points (2, 187) and (118, 177).
; PLAN: r0=2(x1), r1=187(y1), r2=118(x2), r3=177(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 187
LDI r2, 118
LDI r3, 177
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
