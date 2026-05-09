; DESCRIPTION: Draws a green line from (101, 23) to (53, 34).
; PLAN: r0=101(x1), r1=23(y1), r2=53(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 23
LDI r2, 53
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
