; DESCRIPTION: Draws a magenta line from (59, 64) to (361, 77).
; PLAN: r0=59(x1), r1=64(y1), r2=361(x2), r3=77(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 64
LDI r2, 361
LDI r3, 77
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
