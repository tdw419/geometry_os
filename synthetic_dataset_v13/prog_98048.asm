; DESCRIPTION: Places a magenta line segment connecting (328, 205) to (212, 243).
; PLAN: r0=328(x1), r1=205(y1), r2=212(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 205
LDI r2, 212
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
