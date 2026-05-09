; DESCRIPTION: Draws a magenta line from (208, 169) to (394, 108).
; PLAN: r0=208(x1), r1=169(y1), r2=394(x2), r3=108(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 169
LDI r2, 394
LDI r3, 108
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
