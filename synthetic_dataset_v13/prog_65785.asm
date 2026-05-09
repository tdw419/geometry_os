; DESCRIPTION: Draws a yellow line from (386, 114) to (311, 251).
; PLAN: r0=386(x1), r1=114(y1), r2=311(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 114
LDI r2, 311
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
