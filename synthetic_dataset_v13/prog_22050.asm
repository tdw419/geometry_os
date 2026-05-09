; DESCRIPTION: Places a magenta line segment connecting (52, 146) to (57, 94).
; PLAN: r0=52(x1), r1=146(y1), r2=57(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 146
LDI r2, 57
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
