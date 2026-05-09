; DESCRIPTION: Renders a white line between points (235, 117) and (149, 254).
; PLAN: r0=235(x1), r1=117(y1), r2=149(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 117
LDI r2, 149
LDI r3, 254
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
