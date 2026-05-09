; DESCRIPTION: Renders a orange line between points (490, 205) and (63, 166).
; PLAN: r0=490(x1), r1=205(y1), r2=63(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 205
LDI r2, 63
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
