; DESCRIPTION: Places a blue line segment connecting (208, 9) to (350, 125).
; PLAN: r0=208(x1), r1=9(y1), r2=350(x2), r3=125(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 9
LDI r2, 350
LDI r3, 125
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
