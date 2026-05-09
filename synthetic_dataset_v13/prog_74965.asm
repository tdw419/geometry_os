; DESCRIPTION: Draws a green line from (172, 9) to (88, 37).
; PLAN: r0=172(x1), r1=9(y1), r2=88(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 9
LDI r2, 88
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
