; DESCRIPTION: Draws a yellow line from (18, 74) to (442, 227).
; PLAN: r0=18(x1), r1=74(y1), r2=442(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 74
LDI r2, 442
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
