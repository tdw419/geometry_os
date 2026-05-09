; DESCRIPTION: Draws a magenta line from (414, 191) to (127, 57).
; PLAN: r0=414(x1), r1=191(y1), r2=127(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 191
LDI r2, 127
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
