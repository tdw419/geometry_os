; DESCRIPTION: Draws a magenta line from (414, 188) to (305, 107).
; PLAN: r0=414(x1), r1=188(y1), r2=305(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 188
LDI r2, 305
LDI r3, 107
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
