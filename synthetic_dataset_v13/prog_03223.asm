; DESCRIPTION: Draws a yellow line from (399, 10) to (206, 252).
; PLAN: r0=399(x1), r1=10(y1), r2=206(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 10
LDI r2, 206
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
