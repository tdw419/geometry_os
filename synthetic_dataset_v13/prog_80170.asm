; DESCRIPTION: Places a red line segment connecting (170, 46) to (384, 106).
; PLAN: r0=170(x1), r1=46(y1), r2=384(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 46
LDI r2, 384
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
