; DESCRIPTION: Draws a orange line from (333, 67) to (95, 74).
; PLAN: r0=333(x1), r1=67(y1), r2=95(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 67
LDI r2, 95
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
