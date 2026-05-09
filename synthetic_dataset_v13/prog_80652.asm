; DESCRIPTION: Places a magenta line segment connecting (29, 7) to (52, 240).
; PLAN: r0=29(x1), r1=7(y1), r2=52(x2), r3=240(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 7
LDI r2, 52
LDI r3, 240
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
