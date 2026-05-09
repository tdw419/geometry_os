; DESCRIPTION: Draws a magenta line from (267, 104) to (83, 38).
; PLAN: r0=267(x1), r1=104(y1), r2=83(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 104
LDI r2, 83
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
