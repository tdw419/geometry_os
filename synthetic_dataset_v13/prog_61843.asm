; DESCRIPTION: Draws a yellow line from (216, 238) to (143, 50).
; PLAN: r0=216(x1), r1=238(y1), r2=143(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 238
LDI r2, 143
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
