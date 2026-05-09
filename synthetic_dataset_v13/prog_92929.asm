; DESCRIPTION: Renders a red line between points (198, 74) and (328, 29).
; PLAN: r0=198(x1), r1=74(y1), r2=328(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 74
LDI r2, 328
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
