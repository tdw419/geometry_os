; DESCRIPTION: Draws a red line from (488, 145) to (78, 67).
; PLAN: r0=488(x1), r1=145(y1), r2=78(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 145
LDI r2, 78
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
