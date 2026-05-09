; DESCRIPTION: Draws a red line from (20, 179) to (485, 205).
; PLAN: r0=20(x1), r1=179(y1), r2=485(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 179
LDI r2, 485
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
