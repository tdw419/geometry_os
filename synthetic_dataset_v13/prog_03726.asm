; DESCRIPTION: Draws a magenta line from (240, 109) to (455, 46).
; PLAN: r0=240(x1), r1=109(y1), r2=455(x2), r3=46(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 109
LDI r2, 455
LDI r3, 46
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
