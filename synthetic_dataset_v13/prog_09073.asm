; DESCRIPTION: Draws a black line from (9, 131) to (69, 156).
; PLAN: r0=9(x1), r1=131(y1), r2=69(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 131
LDI r2, 69
LDI r3, 156
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
