; DESCRIPTION: Draws a magenta line from (431, 47) to (252, 170).
; PLAN: r0=431(x1), r1=47(y1), r2=252(x2), r3=170(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 47
LDI r2, 252
LDI r3, 170
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
