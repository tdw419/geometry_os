; DESCRIPTION: Draws a magenta line from (307, 140) to (237, 248).
; PLAN: r0=307(x1), r1=140(y1), r2=237(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 140
LDI r2, 237
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
