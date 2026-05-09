; DESCRIPTION: Draws a green line from (390, 71) to (412, 192).
; PLAN: r0=390(x1), r1=71(y1), r2=412(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 71
LDI r2, 412
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
