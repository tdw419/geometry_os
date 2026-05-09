; DESCRIPTION: Renders a green line between points (119, 168) and (20, 61).
; PLAN: r0=119(x1), r1=168(y1), r2=20(x2), r3=61(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 168
LDI r2, 20
LDI r3, 61
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
