; DESCRIPTION: Renders a red line between points (114, 252) and (401, 254).
; PLAN: r0=114(x1), r1=252(y1), r2=401(x2), r3=254(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 252
LDI r2, 401
LDI r3, 254
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
