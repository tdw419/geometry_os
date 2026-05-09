; DESCRIPTION: Renders a green line between points (403, 13) and (80, 74).
; PLAN: r0=403(x1), r1=13(y1), r2=80(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 13
LDI r2, 80
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
