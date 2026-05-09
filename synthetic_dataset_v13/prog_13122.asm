; DESCRIPTION: Places a orange line segment connecting (220, 149) to (243, 188).
; PLAN: r0=220(x1), r1=149(y1), r2=243(x2), r3=188(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 149
LDI r2, 243
LDI r3, 188
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
