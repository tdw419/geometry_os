; DESCRIPTION: Draws a magenta line from (57, 43) to (459, 91).
; PLAN: r0=57(x1), r1=43(y1), r2=459(x2), r3=91(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 43
LDI r2, 459
LDI r3, 91
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
