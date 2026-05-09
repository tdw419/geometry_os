; DESCRIPTION: Draws a magenta line from (168, 157) to (13, 67).
; PLAN: r0=168(x1), r1=157(y1), r2=13(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 157
LDI r2, 13
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
