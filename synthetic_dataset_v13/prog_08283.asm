; DESCRIPTION: Places a orange line segment connecting (411, 173) to (108, 198).
; PLAN: r0=411(x1), r1=173(y1), r2=108(x2), r3=198(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 173
LDI r2, 108
LDI r3, 198
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
