; DESCRIPTION: Draws a yellow line from (20, 25) to (223, 76).
; PLAN: r0=20(x1), r1=25(y1), r2=223(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 25
LDI r2, 223
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
