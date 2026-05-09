; DESCRIPTION: Renders a white line between points (139, 187) and (437, 0).
; PLAN: r0=139(x1), r1=187(y1), r2=437(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 187
LDI r2, 437
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
