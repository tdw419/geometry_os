; DESCRIPTION: Draws a green line from (141, 198) to (493, 64).
; PLAN: r0=141(x1), r1=198(y1), r2=493(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 198
LDI r2, 493
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
