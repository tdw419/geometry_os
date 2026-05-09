; DESCRIPTION: Draws a magenta line from (414, 253) to (305, 163).
; PLAN: r0=414(x1), r1=253(y1), r2=305(x2), r3=163(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 253
LDI r2, 305
LDI r3, 163
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
