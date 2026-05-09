; DESCRIPTION: Places a yellow line segment connecting (113, 37) to (79, 75).
; PLAN: r0=113(x1), r1=37(y1), r2=79(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 37
LDI r2, 79
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
