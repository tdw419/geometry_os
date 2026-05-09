; DESCRIPTION: Draws a yellow line from (368, 56) to (371, 249).
; PLAN: r0=368(x1), r1=56(y1), r2=371(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 56
LDI r2, 371
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
