; DESCRIPTION: Renders a yellow line between points (267, 3) and (113, 189).
; PLAN: r0=267(x1), r1=3(y1), r2=113(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 3
LDI r2, 113
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
