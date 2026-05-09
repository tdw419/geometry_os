; DESCRIPTION: Draws a magenta line from (87, 234) to (44, 167).
; PLAN: r0=87(x1), r1=234(y1), r2=44(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 234
LDI r2, 44
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
