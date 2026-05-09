; DESCRIPTION: Draws a magenta line from (39, 96) to (99, 59).
; PLAN: r0=39(x1), r1=96(y1), r2=99(x2), r3=59(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 96
LDI r2, 99
LDI r3, 59
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
