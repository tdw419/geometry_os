; DESCRIPTION: Draws a orange line from (259, 7) to (473, 219).
; PLAN: r0=259(x1), r1=7(y1), r2=473(x2), r3=219(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 7
LDI r2, 473
LDI r3, 219
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
