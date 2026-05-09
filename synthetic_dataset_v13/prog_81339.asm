; DESCRIPTION: Renders a yellow line between points (440, 72) and (20, 254).
; PLAN: r0=440(x1), r1=72(y1), r2=20(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 72
LDI r2, 20
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
