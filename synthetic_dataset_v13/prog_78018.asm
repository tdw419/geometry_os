; DESCRIPTION: Renders a red line between points (385, 206) and (277, 2).
; PLAN: r0=385(x1), r1=206(y1), r2=277(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 206
LDI r2, 277
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
