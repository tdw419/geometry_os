; DESCRIPTION: Draws a orange line from (435, 89) to (488, 202).
; PLAN: r0=435(x1), r1=89(y1), r2=488(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 89
LDI r2, 488
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
