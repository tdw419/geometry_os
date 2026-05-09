; DESCRIPTION: Draws a green line from (342, 133) to (485, 62).
; PLAN: r0=342(x1), r1=133(y1), r2=485(x2), r3=62(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 133
LDI r2, 485
LDI r3, 62
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
