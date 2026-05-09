; DESCRIPTION: Places a yellow line segment connecting (510, 71) to (437, 113).
; PLAN: r0=510(x1), r1=71(y1), r2=437(x2), r3=113(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 71
LDI r2, 437
LDI r3, 113
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
