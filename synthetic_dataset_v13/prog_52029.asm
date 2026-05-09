; DESCRIPTION: Draws a green line from (459, 23) to (21, 77).
; PLAN: r0=459(x1), r1=23(y1), r2=21(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 23
LDI r2, 21
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
