; DESCRIPTION: Places a orange line segment connecting (90, 132) to (202, 255).
; PLAN: r0=90(x1), r1=132(y1), r2=202(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 132
LDI r2, 202
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
