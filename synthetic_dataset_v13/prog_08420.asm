; DESCRIPTION: Places a orange line segment connecting (130, 65) to (179, 113).
; PLAN: r0=130(x1), r1=65(y1), r2=179(x2), r3=113(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 65
LDI r2, 179
LDI r3, 113
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
