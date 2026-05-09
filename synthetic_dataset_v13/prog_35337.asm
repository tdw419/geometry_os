; DESCRIPTION: Renders a green line between points (95, 54) and (440, 101).
; PLAN: r0=95(x1), r1=54(y1), r2=440(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 54
LDI r2, 440
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
