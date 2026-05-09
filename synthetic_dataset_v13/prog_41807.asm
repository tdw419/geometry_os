; DESCRIPTION: Places a orange line segment connecting (44, 70) to (127, 243).
; PLAN: r0=44(x1), r1=70(y1), r2=127(x2), r3=243(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 70
LDI r2, 127
LDI r3, 243
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
