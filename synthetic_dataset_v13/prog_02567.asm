; DESCRIPTION: Renders a yellow line between points (14, 206) and (80, 82).
; PLAN: r0=14(x1), r1=206(y1), r2=80(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 206
LDI r2, 80
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
