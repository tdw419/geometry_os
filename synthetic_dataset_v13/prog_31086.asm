; DESCRIPTION: Places a blue line segment connecting (488, 209) to (317, 205).
; PLAN: r0=488(x1), r1=209(y1), r2=317(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 209
LDI r2, 317
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
