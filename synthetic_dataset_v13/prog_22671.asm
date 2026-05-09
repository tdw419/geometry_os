; DESCRIPTION: Draws a magenta line from (460, 136) to (280, 90).
; PLAN: r0=460(x1), r1=136(y1), r2=280(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 136
LDI r2, 280
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
