; DESCRIPTION: Draws a orange line from (398, 55) to (386, 252).
; PLAN: r0=398(x1), r1=55(y1), r2=386(x2), r3=252(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 55
LDI r2, 386
LDI r3, 252
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
