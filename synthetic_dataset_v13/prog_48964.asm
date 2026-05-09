; DESCRIPTION: Renders a white line between points (326, 34) and (9, 187).
; PLAN: r0=326(x1), r1=34(y1), r2=9(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 34
LDI r2, 9
LDI r3, 187
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
