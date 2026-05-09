; DESCRIPTION: Draws a black line from (481, 78) to (473, 218).
; PLAN: r0=481(x1), r1=78(y1), r2=473(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 78
LDI r2, 473
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
