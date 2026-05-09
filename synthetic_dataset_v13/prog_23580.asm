; DESCRIPTION: Places a blue line segment connecting (363, 124) to (488, 12).
; PLAN: r0=363(x1), r1=124(y1), r2=488(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 124
LDI r2, 488
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
