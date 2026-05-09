; DESCRIPTION: Draws a yellow line from (223, 177) to (353, 91).
; PLAN: r0=223(x1), r1=177(y1), r2=353(x2), r3=91(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 177
LDI r2, 353
LDI r3, 91
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
