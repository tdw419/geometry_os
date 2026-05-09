; DESCRIPTION: Places a magenta line segment connecting (366, 84) to (383, 146).
; PLAN: r0=366(x1), r1=84(y1), r2=383(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 84
LDI r2, 383
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
