; DESCRIPTION: Draws a yellow line from (221, 16) to (91, 61).
; PLAN: r0=221(x1), r1=16(y1), r2=91(x2), r3=61(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 16
LDI r2, 91
LDI r3, 61
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
