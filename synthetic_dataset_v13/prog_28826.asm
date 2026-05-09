; DESCRIPTION: Renders a green line between points (168, 208) and (40, 80).
; PLAN: r0=168(x1), r1=208(y1), r2=40(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 208
LDI r2, 40
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
