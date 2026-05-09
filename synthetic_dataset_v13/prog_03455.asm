; DESCRIPTION: Draws a orange line from (196, 23) to (445, 85).
; PLAN: r0=196(x1), r1=23(y1), r2=445(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 23
LDI r2, 445
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
