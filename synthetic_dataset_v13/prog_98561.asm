; DESCRIPTION: Draws a orange line from (32, 170) to (386, 47).
; PLAN: r0=32(x1), r1=170(y1), r2=386(x2), r3=47(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 170
LDI r2, 386
LDI r3, 47
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
