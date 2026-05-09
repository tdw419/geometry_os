; DESCRIPTION: Draws a magenta line from (504, 246) to (80, 204).
; PLAN: r0=504(x1), r1=246(y1), r2=80(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 246
LDI r2, 80
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
