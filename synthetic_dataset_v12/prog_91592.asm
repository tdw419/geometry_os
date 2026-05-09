; DESCRIPTION: Places a orange line segment connecting (372, 173) to (291, 210).
; PLAN: r0=372(x1), r1=173(y1), r2=291(x2), r3=210(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 173
LDI r2, 291
LDI r3, 210
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
