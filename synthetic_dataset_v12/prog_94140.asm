; DESCRIPTION: Draws a magenta line from (39, 44) to (161, 4).
; PLAN: r0=39(x1), r1=44(y1), r2=161(x2), r3=4(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 44
LDI r2, 161
LDI r3, 4
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
