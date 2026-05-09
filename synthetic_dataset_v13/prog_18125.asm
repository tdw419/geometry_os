; DESCRIPTION: Renders a green line between points (70, 214) and (91, 158).
; PLAN: r0=70(x1), r1=214(y1), r2=91(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 214
LDI r2, 91
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
