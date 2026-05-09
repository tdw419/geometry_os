; DESCRIPTION: Draws a magenta line from (178, 160) to (18, 115).
; PLAN: r0=178(x1), r1=160(y1), r2=18(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 160
LDI r2, 18
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
