; DESCRIPTION: Draws a magenta line from (168, 19) to (144, 144).
; PLAN: r0=168(x1), r1=19(y1), r2=144(x2), r3=144(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 19
LDI r2, 144
LDI r3, 144
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
