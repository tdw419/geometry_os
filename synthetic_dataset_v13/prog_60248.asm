; DESCRIPTION: Draws a magenta line from (177, 162) to (466, 222).
; PLAN: r0=177(x1), r1=162(y1), r2=466(x2), r3=222(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 162
LDI r2, 466
LDI r3, 222
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
