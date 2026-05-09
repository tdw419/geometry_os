; DESCRIPTION: Places a orange line segment connecting (254, 4) to (197, 169).
; PLAN: r0=254(x1), r1=4(y1), r2=197(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 4
LDI r2, 197
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
