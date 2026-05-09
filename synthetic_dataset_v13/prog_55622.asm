; DESCRIPTION: Renders a green line between points (225, 103) and (158, 30).
; PLAN: r0=225(x1), r1=103(y1), r2=158(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 103
LDI r2, 158
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
