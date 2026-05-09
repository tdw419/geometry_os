; DESCRIPTION: Places a orange line segment connecting (219, 146) to (124, 86).
; PLAN: r0=219(x1), r1=146(y1), r2=124(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 146
LDI r2, 124
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
