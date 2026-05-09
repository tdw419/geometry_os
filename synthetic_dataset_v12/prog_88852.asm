; DESCRIPTION: Draws a green line from (366, 34) to (73, 39).
; PLAN: r0=366(x1), r1=34(y1), r2=73(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 34
LDI r2, 73
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
