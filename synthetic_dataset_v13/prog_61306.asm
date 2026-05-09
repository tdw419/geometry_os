; DESCRIPTION: Places a yellow line segment connecting (510, 111) to (226, 45).
; PLAN: r0=510(x1), r1=111(y1), r2=226(x2), r3=45(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 111
LDI r2, 226
LDI r3, 45
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
