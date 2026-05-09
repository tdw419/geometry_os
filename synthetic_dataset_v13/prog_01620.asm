; DESCRIPTION: Draws a magenta line from (157, 168) to (374, 141).
; PLAN: r0=157(x1), r1=168(y1), r2=374(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 168
LDI r2, 374
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
