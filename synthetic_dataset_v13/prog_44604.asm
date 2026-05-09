; DESCRIPTION: Draws a yellow line from (311, 150) to (251, 91).
; PLAN: r0=311(x1), r1=150(y1), r2=251(x2), r3=91(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 150
LDI r2, 251
LDI r3, 91
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
