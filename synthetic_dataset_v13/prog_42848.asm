; DESCRIPTION: Draws a yellow line from (75, 131) to (492, 247).
; PLAN: r0=75(x1), r1=131(y1), r2=492(x2), r3=247(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 131
LDI r2, 492
LDI r3, 247
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
