; DESCRIPTION: Draws a magenta line from (66, 153) to (245, 60).
; PLAN: r0=66(x1), r1=153(y1), r2=245(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 153
LDI r2, 245
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
