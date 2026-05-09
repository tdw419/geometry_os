; DESCRIPTION: Renders a white line between points (309, 156) and (171, 91).
; PLAN: r0=309(x1), r1=156(y1), r2=171(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 156
LDI r2, 171
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
