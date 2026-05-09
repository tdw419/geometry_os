; DESCRIPTION: Draws a green line from (141, 179) to (271, 133).
; PLAN: r0=141(x1), r1=179(y1), r2=271(x2), r3=133(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 179
LDI r2, 271
LDI r3, 133
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
