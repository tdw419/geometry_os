; DESCRIPTION: Places a red line segment connecting (153, 242) to (94, 173).
; PLAN: r0=153(x1), r1=242(y1), r2=94(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 242
LDI r2, 94
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
