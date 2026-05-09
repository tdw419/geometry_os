; DESCRIPTION: Draws a magenta line from (66, 205) to (322, 69).
; PLAN: r0=66(x1), r1=205(y1), r2=322(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 205
LDI r2, 322
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
