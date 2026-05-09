; DESCRIPTION: Draws a yellow line from (35, 131) to (15, 50).
; PLAN: r0=35(x1), r1=131(y1), r2=15(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 131
LDI r2, 15
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
