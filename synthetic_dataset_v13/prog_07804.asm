; DESCRIPTION: Draws a yellow line from (26, 126) to (94, 131).
; PLAN: r0=26(x1), r1=126(y1), r2=94(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 126
LDI r2, 94
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
