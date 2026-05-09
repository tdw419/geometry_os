; DESCRIPTION: Draws a yellow line from (141, 150) to (126, 140).
; PLAN: r0=141(x1), r1=150(y1), r2=126(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 150
LDI r2, 126
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
