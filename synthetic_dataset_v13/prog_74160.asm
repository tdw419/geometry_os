; DESCRIPTION: Draws a magenta line from (460, 112) to (186, 246).
; PLAN: r0=460(x1), r1=112(y1), r2=186(x2), r3=246(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 112
LDI r2, 186
LDI r3, 246
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
