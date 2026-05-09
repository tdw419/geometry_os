; DESCRIPTION: Draws a blue line from (488, 21) to (56, 61).
; PLAN: r0=488(x1), r1=21(y1), r2=56(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 21
LDI r2, 56
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
