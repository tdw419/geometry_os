; DESCRIPTION: Draws a blue line from (66, 165) to (245, 178).
; PLAN: r0=66(x1), r1=165(y1), r2=245(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 165
LDI r2, 245
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
