; DESCRIPTION: Renders a red line between points (336, 31) and (33, 161).
; PLAN: r0=336(x1), r1=31(y1), r2=33(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 31
LDI r2, 33
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
