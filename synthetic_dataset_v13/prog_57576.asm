; DESCRIPTION: Draws a yellow line from (312, 23) to (442, 177).
; PLAN: r0=312(x1), r1=23(y1), r2=442(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 23
LDI r2, 442
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
