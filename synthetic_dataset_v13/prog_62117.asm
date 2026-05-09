; DESCRIPTION: Renders a white line between points (71, 138) and (145, 150).
; PLAN: r0=71(x1), r1=138(y1), r2=145(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 138
LDI r2, 145
LDI r3, 150
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
