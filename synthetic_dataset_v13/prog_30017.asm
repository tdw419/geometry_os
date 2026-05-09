; DESCRIPTION: Places a orange line segment connecting (295, 124) to (312, 6).
; PLAN: r0=295(x1), r1=124(y1), r2=312(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 124
LDI r2, 312
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
