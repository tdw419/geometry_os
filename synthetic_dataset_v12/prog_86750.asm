; DESCRIPTION: Places a magenta line segment connecting (510, 71) to (286, 187).
; PLAN: r0=510(x1), r1=71(y1), r2=286(x2), r3=187(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 71
LDI r2, 286
LDI r3, 187
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
