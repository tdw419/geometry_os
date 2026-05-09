; DESCRIPTION: Renders a white line between points (94, 94) and (290, 38).
; PLAN: r0=94(x1), r1=94(y1), r2=290(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 94
LDI r2, 290
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
