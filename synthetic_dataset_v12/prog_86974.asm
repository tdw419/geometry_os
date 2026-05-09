; DESCRIPTION: Draws a magenta line from (263, 233) to (166, 159).
; PLAN: r0=263(x1), r1=233(y1), r2=166(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 233
LDI r2, 166
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
