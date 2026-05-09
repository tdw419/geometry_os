; DESCRIPTION: Draws a orange line from (345, 60) to (405, 50).
; PLAN: r0=345(x1), r1=60(y1), r2=405(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 60
LDI r2, 405
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
