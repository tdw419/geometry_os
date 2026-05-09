; DESCRIPTION: Renders a yellow line between points (379, 135) and (267, 125).
; PLAN: r0=379(x1), r1=135(y1), r2=267(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 135
LDI r2, 267
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
