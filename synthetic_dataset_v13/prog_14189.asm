; DESCRIPTION: Renders a white line between points (3, 41) and (363, 28).
; PLAN: r0=3(x1), r1=41(y1), r2=363(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 41
LDI r2, 363
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
