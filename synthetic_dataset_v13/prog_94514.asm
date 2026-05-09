; DESCRIPTION: Places a black line segment connecting (180, 62) to (488, 220).
; PLAN: r0=180(x1), r1=62(y1), r2=488(x2), r3=220(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 62
LDI r2, 488
LDI r3, 220
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
