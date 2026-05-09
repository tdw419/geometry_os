; DESCRIPTION: Draws a magenta line from (203, 148) to (412, 151).
; PLAN: r0=203(x1), r1=148(y1), r2=412(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 148
LDI r2, 412
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
