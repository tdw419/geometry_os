; DESCRIPTION: Places a orange line segment connecting (168, 200) to (258, 113).
; PLAN: r0=168(x1), r1=200(y1), r2=258(x2), r3=113(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 200
LDI r2, 258
LDI r3, 113
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
