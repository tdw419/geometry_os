; DESCRIPTION: Places a magenta line segment connecting (94, 57) to (447, 213).
; PLAN: r0=94(x1), r1=57(y1), r2=447(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 57
LDI r2, 447
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
