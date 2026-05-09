; DESCRIPTION: Renders a blue line between points (48, 252) and (1, 220).
; PLAN: r0=48(x1), r1=252(y1), r2=1(x2), r3=220(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 252
LDI r2, 1
LDI r3, 220
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
