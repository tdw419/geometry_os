; DESCRIPTION: Places a white line segment connecting (443, 77) to (177, 25).
; PLAN: r0=443(x1), r1=77(y1), r2=177(x2), r3=25(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 77
LDI r2, 177
LDI r3, 25
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
