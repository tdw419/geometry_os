; DESCRIPTION: Places a magenta line segment connecting (44, 158) to (240, 174).
; PLAN: r0=44(x1), r1=158(y1), r2=240(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 158
LDI r2, 240
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
