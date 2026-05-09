; DESCRIPTION: Renders a white line between points (184, 149) and (443, 112).
; PLAN: r0=184(x1), r1=149(y1), r2=443(x2), r3=112(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 149
LDI r2, 443
LDI r3, 112
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
