; DESCRIPTION: Draws a magenta line from (21, 165) to (119, 86).
; PLAN: r0=21(x1), r1=165(y1), r2=119(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 165
LDI r2, 119
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
