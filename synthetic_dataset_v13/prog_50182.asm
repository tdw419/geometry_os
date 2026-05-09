; DESCRIPTION: Places a magenta line segment connecting (153, 146) to (187, 11).
; PLAN: r0=153(x1), r1=146(y1), r2=187(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 146
LDI r2, 187
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
