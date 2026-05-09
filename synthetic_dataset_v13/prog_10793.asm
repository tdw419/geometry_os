; DESCRIPTION: Draws a magenta line from (207, 34) to (8, 48).
; PLAN: r0=207(x1), r1=34(y1), r2=8(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 34
LDI r2, 8
LDI r3, 48
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
