; DESCRIPTION: Renders a red line between points (198, 184) and (277, 83).
; PLAN: r0=198(x1), r1=184(y1), r2=277(x2), r3=83(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 184
LDI r2, 277
LDI r3, 83
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
