; DESCRIPTION: Places a orange line segment connecting (444, 47) to (305, 28).
; PLAN: r0=444(x1), r1=47(y1), r2=305(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 47
LDI r2, 305
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
