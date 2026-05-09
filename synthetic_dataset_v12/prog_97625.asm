; DESCRIPTION: Draws a magenta line from (471, 46) to (54, 83).
; PLAN: r0=471(x1), r1=46(y1), r2=54(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 46
LDI r2, 54
LDI r3, 83
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
