; DESCRIPTION: Draws a yellow line from (414, 208) to (387, 1).
; PLAN: r0=414(x1), r1=208(y1), r2=387(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 208
LDI r2, 387
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
