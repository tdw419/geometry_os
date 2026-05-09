; DESCRIPTION: Draws a green line from (37, 153) to (368, 162).
; PLAN: r0=37(x1), r1=153(y1), r2=368(x2), r3=162(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 153
LDI r2, 368
LDI r3, 162
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
