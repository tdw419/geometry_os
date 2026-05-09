; DESCRIPTION: Draws a green line from (390, 36) to (103, 187).
; PLAN: r0=390(x1), r1=36(y1), r2=103(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 36
LDI r2, 103
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
