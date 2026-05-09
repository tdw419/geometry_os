; DESCRIPTION: Draws a orange line from (216, 64) to (120, 13).
; PLAN: r0=216(x1), r1=64(y1), r2=120(x2), r3=13(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 64
LDI r2, 120
LDI r3, 13
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
