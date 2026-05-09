; DESCRIPTION: Places a green line segment connecting (220, 43) to (20, 51).
; PLAN: r0=220(x1), r1=43(y1), r2=20(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 43
LDI r2, 20
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
