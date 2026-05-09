; DESCRIPTION: Renders a purple line between points (174, 174) and (401, 31).
; PLAN: r0=174(x1), r1=174(y1), r2=401(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 174
LDI r2, 401
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
