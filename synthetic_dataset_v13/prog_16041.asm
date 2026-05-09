; DESCRIPTION: Draws a magenta line from (426, 161) to (263, 15).
; PLAN: r0=426(x1), r1=161(y1), r2=263(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 161
LDI r2, 263
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
