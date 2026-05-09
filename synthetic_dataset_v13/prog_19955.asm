; DESCRIPTION: Draws a yellow line from (468, 47) to (238, 160).
; PLAN: r0=468(x1), r1=47(y1), r2=238(x2), r3=160(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 47
LDI r2, 238
LDI r3, 160
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
