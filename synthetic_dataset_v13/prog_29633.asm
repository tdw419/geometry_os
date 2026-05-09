; DESCRIPTION: Draws a orange line from (4, 143) to (340, 196).
; PLAN: r0=4(x1), r1=143(y1), r2=340(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 143
LDI r2, 340
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
