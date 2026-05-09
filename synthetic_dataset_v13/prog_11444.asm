; DESCRIPTION: Places a magenta line segment connecting (303, 106) to (220, 173).
; PLAN: r0=303(x1), r1=106(y1), r2=220(x2), r3=173(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 106
LDI r2, 220
LDI r3, 173
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
