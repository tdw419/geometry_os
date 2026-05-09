; DESCRIPTION: Renders a magenta line between points (267, 101) and (298, 244).
; PLAN: r0=267(x1), r1=101(y1), r2=298(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 101
LDI r2, 298
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
