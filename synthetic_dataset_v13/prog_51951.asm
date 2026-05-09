; DESCRIPTION: Renders a green line between points (77, 189) and (113, 3).
; PLAN: r0=77(x1), r1=189(y1), r2=113(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 189
LDI r2, 113
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
