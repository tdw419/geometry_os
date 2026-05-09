; DESCRIPTION: Places a orange line segment connecting (108, 7) to (113, 206).
; PLAN: r0=108(x1), r1=7(y1), r2=113(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 7
LDI r2, 113
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
