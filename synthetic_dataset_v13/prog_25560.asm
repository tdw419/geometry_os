; DESCRIPTION: Draws a orange line from (295, 136) to (108, 164).
; PLAN: r0=295(x1), r1=136(y1), r2=108(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 136
LDI r2, 108
LDI r3, 164
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
