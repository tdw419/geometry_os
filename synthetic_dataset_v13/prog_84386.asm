; DESCRIPTION: Draws a yellow line from (58, 236) to (32, 52).
; PLAN: r0=58(x1), r1=236(y1), r2=32(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 236
LDI r2, 32
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
