; DESCRIPTION: Renders a magenta line between points (267, 234) and (58, 66).
; PLAN: r0=267(x1), r1=234(y1), r2=58(x2), r3=66(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 234
LDI r2, 58
LDI r3, 66
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
