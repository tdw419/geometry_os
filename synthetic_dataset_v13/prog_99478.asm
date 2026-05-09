; DESCRIPTION: Renders a yellow line between points (267, 142) and (378, 236).
; PLAN: r0=267(x1), r1=142(y1), r2=378(x2), r3=236(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 142
LDI r2, 378
LDI r3, 236
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
