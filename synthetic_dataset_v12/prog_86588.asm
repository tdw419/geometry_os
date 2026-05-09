; DESCRIPTION: Draws a black line from (295, 108) to (451, 15).
; PLAN: r0=295(x1), r1=108(y1), r2=451(x2), r3=15(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 108
LDI r2, 451
LDI r3, 15
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
