; DESCRIPTION: Renders a white line between points (58, 127) and (89, 196).
; PLAN: r0=58(x1), r1=127(y1), r2=89(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 127
LDI r2, 89
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
