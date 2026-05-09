; DESCRIPTION: Renders a green line between points (312, 72) and (470, 134).
; PLAN: r0=312(x1), r1=72(y1), r2=470(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 72
LDI r2, 470
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
