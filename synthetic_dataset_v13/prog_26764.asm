; DESCRIPTION: Draws a orange line from (131, 214) to (124, 209).
; PLAN: r0=131(x1), r1=214(y1), r2=124(x2), r3=209(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 214
LDI r2, 124
LDI r3, 209
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
