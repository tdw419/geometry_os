; DESCRIPTION: Renders a red line between points (186, 214) and (260, 25).
; PLAN: r0=186(x1), r1=214(y1), r2=260(x2), r3=25(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 214
LDI r2, 260
LDI r3, 25
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
