; DESCRIPTION: Draws a blue line from (295, 33) to (78, 18).
; PLAN: r0=295(x1), r1=33(y1), r2=78(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 33
LDI r2, 78
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
