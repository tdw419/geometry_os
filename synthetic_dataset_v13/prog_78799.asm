; DESCRIPTION: Draws a blue line from (488, 218) to (0, 249).
; PLAN: r0=488(x1), r1=218(y1), r2=0(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 218
LDI r2, 0
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
