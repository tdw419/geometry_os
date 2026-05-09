; DESCRIPTION: Draws a orange line from (254, 129) to (324, 55).
; PLAN: r0=254(x1), r1=129(y1), r2=324(x2), r3=55(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 129
LDI r2, 324
LDI r3, 55
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
