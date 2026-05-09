; DESCRIPTION: Places a orange line segment connecting (255, 202) to (431, 16).
; PLAN: r0=255(x1), r1=202(y1), r2=431(x2), r3=16(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 202
LDI r2, 431
LDI r3, 16
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
