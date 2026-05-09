; DESCRIPTION: Places a yellow line segment connecting (383, 236) to (380, 92).
; PLAN: r0=383(x1), r1=236(y1), r2=380(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 236
LDI r2, 380
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
