; DESCRIPTION: Draws a magenta line from (360, 27) to (267, 82).
; PLAN: r0=360(x1), r1=27(y1), r2=267(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 27
LDI r2, 267
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
