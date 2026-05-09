; DESCRIPTION: Places a magenta line segment connecting (276, 117) to (266, 146).
; PLAN: r0=276(x1), r1=117(y1), r2=266(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 117
LDI r2, 266
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
