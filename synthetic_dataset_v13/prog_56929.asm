; DESCRIPTION: Draws a orange line from (293, 33) to (59, 40).
; PLAN: r0=293(x1), r1=33(y1), r2=59(x2), r3=40(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 33
LDI r2, 59
LDI r3, 40
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
