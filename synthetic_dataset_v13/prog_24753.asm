; DESCRIPTION: Draws a magenta line from (324, 236) to (4, 59).
; PLAN: r0=324(x1), r1=236(y1), r2=4(x2), r3=59(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 236
LDI r2, 4
LDI r3, 59
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
