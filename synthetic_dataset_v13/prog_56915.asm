; DESCRIPTION: Draws a black line from (488, 131) to (226, 230).
; PLAN: r0=488(x1), r1=131(y1), r2=226(x2), r3=230(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 131
LDI r2, 226
LDI r3, 230
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
