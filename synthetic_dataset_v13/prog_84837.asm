; DESCRIPTION: Renders a red line between points (27, 75) and (216, 171).
; PLAN: r0=27(x1), r1=75(y1), r2=216(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 75
LDI r2, 216
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
