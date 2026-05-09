; DESCRIPTION: Draws a magenta line from (196, 87) to (114, 143).
; PLAN: r0=196(x1), r1=87(y1), r2=114(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 87
LDI r2, 114
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
