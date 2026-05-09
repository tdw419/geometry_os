; DESCRIPTION: Draws a white line from (95, 216) to (443, 9).
; PLAN: r0=95(x1), r1=216(y1), r2=443(x2), r3=9(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 216
LDI r2, 443
LDI r3, 9
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
