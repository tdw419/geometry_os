; DESCRIPTION: Draws a orange line from (434, 164) to (473, 31).
; PLAN: r0=434(x1), r1=164(y1), r2=473(x2), r3=31(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 164
LDI r2, 473
LDI r3, 31
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
