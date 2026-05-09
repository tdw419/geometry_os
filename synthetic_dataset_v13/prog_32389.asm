; DESCRIPTION: Draws a magenta line from (300, 114) to (33, 173).
; PLAN: r0=300(x1), r1=114(y1), r2=33(x2), r3=173(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 114
LDI r2, 33
LDI r3, 173
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
