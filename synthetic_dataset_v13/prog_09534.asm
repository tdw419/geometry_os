; DESCRIPTION: Places a yellow line segment connecting (330, 127) to (315, 127).
; PLAN: r0=330(x1), r1=127(y1), r2=315(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 127
LDI r2, 315
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
