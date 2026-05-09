; DESCRIPTION: Renders a red line between points (370, 158) and (305, 134).
; PLAN: r0=370(x1), r1=158(y1), r2=305(x2), r3=134(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 158
LDI r2, 305
LDI r3, 134
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
