; DESCRIPTION: Draws a yellow line from (511, 249) to (312, 134).
; PLAN: r0=511(x1), r1=249(y1), r2=312(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 249
LDI r2, 312
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
