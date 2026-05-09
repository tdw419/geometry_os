; DESCRIPTION: Places a red line segment connecting (100, 240) to (510, 237).
; PLAN: r0=100(x1), r1=240(y1), r2=510(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 240
LDI r2, 510
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
