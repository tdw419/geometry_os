; DESCRIPTION: Draws a blue line from (398, 88) to (196, 41).
; PLAN: r0=398(x1), r1=88(y1), r2=196(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 88
LDI r2, 196
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
