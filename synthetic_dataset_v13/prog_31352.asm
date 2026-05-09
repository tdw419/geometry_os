; DESCRIPTION: Draws a cyan line from (485, 135) to (98, 85).
; PLAN: r0=485(x1), r1=135(y1), r2=98(x2), r3=85(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 135
LDI r2, 98
LDI r3, 85
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
