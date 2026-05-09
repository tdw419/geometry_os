; DESCRIPTION: Draws a black line from (117, 32) to (147, 60).
; PLAN: r0=117(x1), r1=32(y1), r2=147(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 32
LDI r2, 147
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
