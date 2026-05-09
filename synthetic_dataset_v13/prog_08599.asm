; DESCRIPTION: Draws a black line from (99, 173) to (11, 123).
; PLAN: r0=99(x1), r1=173(y1), r2=11(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 173
LDI r2, 11
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
