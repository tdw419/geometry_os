; DESCRIPTION: Places a orange line segment connecting (306, 205) to (105, 243).
; PLAN: r0=306(x1), r1=205(y1), r2=105(x2), r3=243(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 205
LDI r2, 105
LDI r3, 243
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
