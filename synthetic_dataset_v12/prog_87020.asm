; DESCRIPTION: Renders a blue line between points (74, 151) and (267, 229).
; PLAN: r0=74(x1), r1=151(y1), r2=267(x2), r3=229(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 151
LDI r2, 267
LDI r3, 229
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
