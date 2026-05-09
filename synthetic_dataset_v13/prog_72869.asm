; DESCRIPTION: Draws a magenta line from (246, 0) to (374, 20).
; PLAN: r0=246(x1), r1=0(y1), r2=374(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 0
LDI r2, 374
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
