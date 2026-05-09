; DESCRIPTION: Renders a green line between points (169, 103) and (72, 124).
; PLAN: r0=169(x1), r1=103(y1), r2=72(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 103
LDI r2, 72
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
