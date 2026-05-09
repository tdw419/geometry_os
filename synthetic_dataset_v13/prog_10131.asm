; DESCRIPTION: Draws a yellow line from (120, 214) to (195, 227).
; PLAN: r0=120(x1), r1=214(y1), r2=195(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 214
LDI r2, 195
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
