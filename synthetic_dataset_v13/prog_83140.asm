; DESCRIPTION: Draws a green line from (154, 34) to (452, 100).
; PLAN: r0=154(x1), r1=34(y1), r2=452(x2), r3=100(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 34
LDI r2, 452
LDI r3, 100
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
