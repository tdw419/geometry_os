; DESCRIPTION: Draws a green line from (139, 161) to (408, 76).
; PLAN: r0=139(x1), r1=161(y1), r2=408(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 161
LDI r2, 408
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
