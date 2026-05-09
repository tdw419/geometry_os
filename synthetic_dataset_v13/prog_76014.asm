; DESCRIPTION: Draws a yellow line from (492, 48) to (99, 41).
; PLAN: r0=492(x1), r1=48(y1), r2=99(x2), r3=41(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 48
LDI r2, 99
LDI r3, 41
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
