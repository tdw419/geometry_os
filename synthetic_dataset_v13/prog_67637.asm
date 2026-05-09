; DESCRIPTION: Draws a green line from (277, 153) to (490, 179).
; PLAN: r0=277(x1), r1=153(y1), r2=490(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 153
LDI r2, 490
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
