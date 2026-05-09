; DESCRIPTION: Draws a yellow line from (321, 168) to (366, 139).
; PLAN: r0=321(x1), r1=168(y1), r2=366(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 168
LDI r2, 366
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
