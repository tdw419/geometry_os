; DESCRIPTION: Renders a white line between points (364, 6) and (145, 125).
; PLAN: r0=364(x1), r1=6(y1), r2=145(x2), r3=125(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 6
LDI r2, 145
LDI r3, 125
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
