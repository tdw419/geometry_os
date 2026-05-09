; DESCRIPTION: Renders a white line between points (409, 61) and (445, 185).
; PLAN: r0=409(x1), r1=61(y1), r2=445(x2), r3=185(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 61
LDI r2, 445
LDI r3, 185
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
