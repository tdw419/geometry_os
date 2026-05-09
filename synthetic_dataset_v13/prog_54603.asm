; DESCRIPTION: Renders a white line between points (406, 156) and (443, 81).
; PLAN: r0=406(x1), r1=156(y1), r2=443(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 156
LDI r2, 443
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
