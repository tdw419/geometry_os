; DESCRIPTION: Draws a orange line from (398, 95) to (444, 156).
; PLAN: r0=398(x1), r1=95(y1), r2=444(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 95
LDI r2, 444
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
