; DESCRIPTION: Renders a white line between points (115, 88) and (443, 182).
; PLAN: r0=115(x1), r1=88(y1), r2=443(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 88
LDI r2, 443
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
