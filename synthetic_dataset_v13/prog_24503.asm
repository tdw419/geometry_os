; DESCRIPTION: Draws a red line from (288, 214) to (485, 89).
; PLAN: r0=288(x1), r1=214(y1), r2=485(x2), r3=89(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 214
LDI r2, 485
LDI r3, 89
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
