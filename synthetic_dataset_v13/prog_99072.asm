; DESCRIPTION: Draws a yellow line from (440, 72) to (491, 165).
; PLAN: r0=440(x1), r1=72(y1), r2=491(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 72
LDI r2, 491
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
