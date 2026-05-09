; DESCRIPTION: Renders a white line between points (28, 71) and (5, 205).
; PLAN: r0=28(x1), r1=71(y1), r2=5(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 71
LDI r2, 5
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
