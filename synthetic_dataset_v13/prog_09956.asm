; DESCRIPTION: Draws a yellow line from (7, 10) to (412, 52).
; PLAN: r0=7(x1), r1=10(y1), r2=412(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 10
LDI r2, 412
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
