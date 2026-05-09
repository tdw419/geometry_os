; DESCRIPTION: Places a orange line segment connecting (127, 255) to (188, 146).
; PLAN: r0=127(x1), r1=255(y1), r2=188(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 255
LDI r2, 188
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
