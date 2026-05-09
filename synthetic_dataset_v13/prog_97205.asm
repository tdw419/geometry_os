; DESCRIPTION: Draws a orange line from (173, 210) to (89, 132).
; PLAN: r0=173(x1), r1=210(y1), r2=89(x2), r3=132(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 210
LDI r2, 89
LDI r3, 132
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
