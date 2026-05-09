; DESCRIPTION: Renders a red line between points (401, 211) and (510, 104).
; PLAN: r0=401(x1), r1=211(y1), r2=510(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 211
LDI r2, 510
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
