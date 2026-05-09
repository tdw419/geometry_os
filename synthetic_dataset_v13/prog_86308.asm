; DESCRIPTION: Renders a white line between points (131, 141) and (52, 205).
; PLAN: r0=131(x1), r1=141(y1), r2=52(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 141
LDI r2, 52
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
