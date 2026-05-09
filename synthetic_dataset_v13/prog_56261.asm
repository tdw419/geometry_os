; DESCRIPTION: Draws a orange line from (76, 59) to (199, 37).
; PLAN: r0=76(x1), r1=59(y1), r2=199(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 59
LDI r2, 199
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
