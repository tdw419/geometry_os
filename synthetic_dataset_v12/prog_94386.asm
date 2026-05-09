; DESCRIPTION: Places a blue line segment connecting (440, 251) to (450, 107).
; PLAN: r0=440(x1), r1=251(y1), r2=450(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 251
LDI r2, 450
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
