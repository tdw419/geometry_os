; DESCRIPTION: Renders a blue line between points (218, 82) and (328, 230).
; PLAN: r0=218(x1), r1=82(y1), r2=328(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 82
LDI r2, 328
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
