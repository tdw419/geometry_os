; DESCRIPTION: Renders a green line between points (70, 22) and (176, 53).
; PLAN: r0=70(x1), r1=22(y1), r2=176(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 22
LDI r2, 176
LDI r3, 53
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
