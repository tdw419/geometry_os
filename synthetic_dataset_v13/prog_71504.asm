; DESCRIPTION: Renders a white line between points (85, 252) and (213, 10).
; PLAN: r0=85(x1), r1=252(y1), r2=213(x2), r3=10(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 252
LDI r2, 213
LDI r3, 10
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
