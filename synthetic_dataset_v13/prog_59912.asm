; DESCRIPTION: Renders a yellow line between points (1, 80) and (184, 207).
; PLAN: r0=1(x1), r1=80(y1), r2=184(x2), r3=207(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 80
LDI r2, 184
LDI r3, 207
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
