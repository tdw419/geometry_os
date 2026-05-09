; DESCRIPTION: Places a yellow line segment connecting (57, 23) to (127, 204).
; PLAN: r0=57(x1), r1=23(y1), r2=127(x2), r3=204(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 23
LDI r2, 127
LDI r3, 204
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
