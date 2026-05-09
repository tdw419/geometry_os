; DESCRIPTION: Places a green line segment connecting (220, 43) to (377, 95).
; PLAN: r0=220(x1), r1=43(y1), r2=377(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 43
LDI r2, 377
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
