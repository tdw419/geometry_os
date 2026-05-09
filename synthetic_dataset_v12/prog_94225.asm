; DESCRIPTION: Renders a red line between points (470, 183) and (277, 62).
; PLAN: r0=470(x1), r1=183(y1), r2=277(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 183
LDI r2, 277
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
