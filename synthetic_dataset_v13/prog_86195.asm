; DESCRIPTION: Places a yellow line segment connecting (150, 93) to (236, 155).
; PLAN: r0=150(x1), r1=93(y1), r2=236(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 93
LDI r2, 236
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
