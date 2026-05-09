; DESCRIPTION: Renders a orange line between points (463, 205) and (465, 54).
; PLAN: r0=463(x1), r1=205(y1), r2=465(x2), r3=54(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 205
LDI r2, 465
LDI r3, 54
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
