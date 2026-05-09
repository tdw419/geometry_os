; DESCRIPTION: Draws a orange line from (116, 101) to (488, 161).
; PLAN: r0=116(x1), r1=101(y1), r2=488(x2), r3=161(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 101
LDI r2, 488
LDI r3, 161
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
