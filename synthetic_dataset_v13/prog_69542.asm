; DESCRIPTION: Draws a orange line from (345, 50) to (111, 243).
; PLAN: r0=345(x1), r1=50(y1), r2=111(x2), r3=243(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 50
LDI r2, 111
LDI r3, 243
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
