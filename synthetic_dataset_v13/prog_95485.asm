; DESCRIPTION: Renders a purple line between points (225, 47) and (401, 37).
; PLAN: r0=225(x1), r1=47(y1), r2=401(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 47
LDI r2, 401
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
