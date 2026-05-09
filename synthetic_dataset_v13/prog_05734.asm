; DESCRIPTION: Draws a cyan line from (484, 89) to (485, 131).
; PLAN: r0=484(x1), r1=89(y1), r2=485(x2), r3=131(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 89
LDI r2, 485
LDI r3, 131
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
