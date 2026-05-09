; DESCRIPTION: Renders a magenta line between points (268, 19) and (267, 112).
; PLAN: r0=268(x1), r1=19(y1), r2=267(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 19
LDI r2, 267
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
