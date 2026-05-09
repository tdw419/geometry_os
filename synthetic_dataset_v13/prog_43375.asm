; DESCRIPTION: Draws a yellow line from (206, 30) to (355, 238).
; PLAN: r0=206(x1), r1=30(y1), r2=355(x2), r3=238(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 30
LDI r2, 355
LDI r3, 238
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
