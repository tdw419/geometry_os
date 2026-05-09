; DESCRIPTION: Draws a black line from (371, 1) to (488, 158).
; PLAN: r0=371(x1), r1=1(y1), r2=488(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 1
LDI r2, 488
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
