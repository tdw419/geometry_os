; DESCRIPTION: Draws a yellow line from (92, 131) to (104, 31).
; PLAN: r0=92(x1), r1=131(y1), r2=104(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 131
LDI r2, 104
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
