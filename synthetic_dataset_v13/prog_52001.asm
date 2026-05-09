; DESCRIPTION: Renders a white line between points (77, 249) and (282, 2).
; PLAN: r0=77(x1), r1=249(y1), r2=282(x2), r3=2(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 249
LDI r2, 282
LDI r3, 2
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
