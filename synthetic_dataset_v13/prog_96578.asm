; DESCRIPTION: Draws a yellow line from (153, 216) to (434, 45).
; PLAN: r0=153(x1), r1=216(y1), r2=434(x2), r3=45(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 216
LDI r2, 434
LDI r3, 45
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
