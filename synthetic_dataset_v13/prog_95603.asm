; DESCRIPTION: Renders a red line between points (410, 64) and (134, 205).
; PLAN: r0=410(x1), r1=64(y1), r2=134(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 64
LDI r2, 134
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
