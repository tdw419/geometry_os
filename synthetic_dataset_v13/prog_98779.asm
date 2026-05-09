; DESCRIPTION: Renders a white line between points (162, 82) and (52, 52).
; PLAN: r0=162(x1), r1=82(y1), r2=52(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 82
LDI r2, 52
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
