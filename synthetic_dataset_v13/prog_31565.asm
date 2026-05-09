; DESCRIPTION: Renders a red line between points (230, 77) and (401, 139).
; PLAN: r0=230(x1), r1=77(y1), r2=401(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 77
LDI r2, 401
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
