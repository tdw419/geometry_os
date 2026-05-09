; DESCRIPTION: Draws a magenta line from (44, 232) to (470, 192).
; PLAN: r0=44(x1), r1=232(y1), r2=470(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 232
LDI r2, 470
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
