; DESCRIPTION: Renders a green line between points (452, 192) and (377, 14).
; PLAN: r0=452(x1), r1=192(y1), r2=377(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 192
LDI r2, 377
LDI r3, 14
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
