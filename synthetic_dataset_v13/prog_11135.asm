; DESCRIPTION: Renders a red line between points (313, 183) and (171, 0).
; PLAN: r0=313(x1), r1=183(y1), r2=171(x2), r3=0(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 183
LDI r2, 171
LDI r3, 0
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
