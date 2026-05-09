; DESCRIPTION: Renders a green line between points (349, 38) and (377, 83).
; PLAN: r0=349(x1), r1=38(y1), r2=377(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 38
LDI r2, 377
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
