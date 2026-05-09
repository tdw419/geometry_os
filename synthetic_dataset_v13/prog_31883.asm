; DESCRIPTION: Renders a red line between points (217, 210) and (47, 4).
; PLAN: r0=217(x1), r1=210(y1), r2=47(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 210
LDI r2, 47
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
