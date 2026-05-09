; DESCRIPTION: Renders a red line between points (125, 186) and (167, 5).
; PLAN: r0=125(x1), r1=186(y1), r2=167(x2), r3=5(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 186
LDI r2, 167
LDI r3, 5
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
