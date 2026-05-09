; DESCRIPTION: Renders a red line between points (198, 183) and (23, 180).
; PLAN: r0=198(x1), r1=183(y1), r2=23(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 183
LDI r2, 23
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
