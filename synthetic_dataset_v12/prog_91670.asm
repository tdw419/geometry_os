; DESCRIPTION: Renders a green line between points (11, 22) and (168, 49).
; PLAN: r0=11(x1), r1=22(y1), r2=168(x2), r3=49(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 22
LDI r2, 168
LDI r3, 49
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
