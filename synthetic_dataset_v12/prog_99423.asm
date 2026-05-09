; DESCRIPTION: Renders a green line between points (64, 106) and (452, 152).
; PLAN: r0=64(x1), r1=106(y1), r2=452(x2), r3=152(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 106
LDI r2, 452
LDI r3, 152
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
