; DESCRIPTION: Renders a red line between points (61, 124) and (417, 36).
; PLAN: r0=61(x1), r1=124(y1), r2=417(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 124
LDI r2, 417
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
