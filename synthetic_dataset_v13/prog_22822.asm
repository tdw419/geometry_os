; DESCRIPTION: Draws a yellow line from (56, 88) to (458, 91).
; PLAN: r0=56(x1), r1=88(y1), r2=458(x2), r3=91(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 88
LDI r2, 458
LDI r3, 91
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
