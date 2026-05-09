; DESCRIPTION: Renders a red line between points (407, 74) and (470, 182).
; PLAN: r0=407(x1), r1=74(y1), r2=470(x2), r3=182(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 74
LDI r2, 470
LDI r3, 182
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
