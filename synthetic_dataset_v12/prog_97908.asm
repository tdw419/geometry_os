; DESCRIPTION: Draws a yellow line from (440, 26) to (267, 142).
; PLAN: r0=440(x1), r1=26(y1), r2=267(x2), r3=142(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 26
LDI r2, 267
LDI r3, 142
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
