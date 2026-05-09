; DESCRIPTION: Renders a green line between points (424, 54) and (95, 221).
; PLAN: r0=424(x1), r1=54(y1), r2=95(x2), r3=221(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 54
LDI r2, 95
LDI r3, 221
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
