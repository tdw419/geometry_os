; DESCRIPTION: Draws a yellow line from (267, 108) to (34, 125).
; PLAN: r0=267(x1), r1=108(y1), r2=34(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 108
LDI r2, 34
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
