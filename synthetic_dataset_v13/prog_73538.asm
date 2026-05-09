; DESCRIPTION: Draws a yellow line from (172, 131) to (90, 10).
; PLAN: r0=172(x1), r1=131(y1), r2=90(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 131
LDI r2, 90
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
