; DESCRIPTION: Renders a yellow line between points (0, 206) and (77, 10).
; PLAN: r0=0(x1), r1=206(y1), r2=77(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 206
LDI r2, 77
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
