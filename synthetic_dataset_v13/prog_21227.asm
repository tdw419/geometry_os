; DESCRIPTION: Places a magenta line segment connecting (465, 13) to (391, 243).
; PLAN: r0=465(x1), r1=13(y1), r2=391(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 13
LDI r2, 391
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
