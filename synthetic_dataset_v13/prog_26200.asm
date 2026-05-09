; DESCRIPTION: Renders a green line between points (466, 13) and (103, 129).
; PLAN: r0=466(x1), r1=13(y1), r2=103(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 13
LDI r2, 103
LDI r3, 129
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
