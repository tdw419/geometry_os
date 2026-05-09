; DESCRIPTION: Renders a white line between points (353, 12) and (98, 89).
; PLAN: r0=353(x1), r1=12(y1), r2=98(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 12
LDI r2, 98
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
