; DESCRIPTION: Renders a yellow line between points (267, 160) and (274, 107).
; PLAN: r0=267(x1), r1=160(y1), r2=274(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 160
LDI r2, 274
LDI r3, 107
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
