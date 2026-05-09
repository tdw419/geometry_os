; DESCRIPTION: Draws a magenta line from (313, 61) to (222, 55).
; PLAN: r0=313(x1), r1=61(y1), r2=222(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 61
LDI r2, 222
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
