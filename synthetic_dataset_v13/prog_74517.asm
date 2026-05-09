; DESCRIPTION: Draws a blue line from (465, 3) to (488, 73).
; PLAN: r0=465(x1), r1=3(y1), r2=488(x2), r3=73(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 3
LDI r2, 488
LDI r3, 73
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
