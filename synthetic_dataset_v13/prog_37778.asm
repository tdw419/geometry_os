; DESCRIPTION: Draws a magenta line from (0, 48) to (157, 225).
; PLAN: r0=0(x1), r1=48(y1), r2=157(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 48
LDI r2, 157
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
