; DESCRIPTION: Draws a magenta line from (165, 151) to (335, 120).
; PLAN: r0=165(x1), r1=151(y1), r2=335(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 151
LDI r2, 335
LDI r3, 120
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
