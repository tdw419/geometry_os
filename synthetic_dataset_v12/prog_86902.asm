; DESCRIPTION: Renders a red line between points (148, 115) and (358, 134).
; PLAN: r0=148(x1), r1=115(y1), r2=358(x2), r3=134(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 115
LDI r2, 358
LDI r3, 134
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
