; DESCRIPTION: Renders a green line between points (47, 18) and (221, 168).
; PLAN: r0=47(x1), r1=18(y1), r2=221(x2), r3=168(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 18
LDI r2, 221
LDI r3, 168
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
