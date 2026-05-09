; DESCRIPTION: Draws a green line from (148, 199) to (162, 254).
; PLAN: r0=148(x1), r1=199(y1), r2=162(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 199
LDI r2, 162
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
