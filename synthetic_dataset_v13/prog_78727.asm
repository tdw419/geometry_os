; DESCRIPTION: Places a yellow line segment connecting (510, 94) to (317, 196).
; PLAN: r0=510(x1), r1=94(y1), r2=317(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 94
LDI r2, 317
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
