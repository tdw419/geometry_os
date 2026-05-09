; DESCRIPTION: Draws a black line from (160, 172) to (222, 131).
; PLAN: r0=160(x1), r1=172(y1), r2=222(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 172
LDI r2, 222
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
