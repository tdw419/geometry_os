; DESCRIPTION: Places a green line segment connecting (291, 171) to (313, 9).
; PLAN: r0=291(x1), r1=171(y1), r2=313(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 171
LDI r2, 313
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
