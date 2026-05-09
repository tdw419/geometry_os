; DESCRIPTION: Draws a yellow line from (91, 234) to (74, 141).
; PLAN: r0=91(x1), r1=234(y1), r2=74(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 234
LDI r2, 74
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
