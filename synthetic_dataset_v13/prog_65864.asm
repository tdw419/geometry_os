; DESCRIPTION: Draws a magenta line from (359, 228) to (227, 172).
; PLAN: r0=359(x1), r1=228(y1), r2=227(x2), r3=172(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 228
LDI r2, 227
LDI r3, 172
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
