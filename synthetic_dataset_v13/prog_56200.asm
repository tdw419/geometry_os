; DESCRIPTION: Draws a magenta line from (474, 3) to (114, 19).
; PLAN: r0=474(x1), r1=3(y1), r2=114(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 3
LDI r2, 114
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
