; DESCRIPTION: Places a orange line segment connecting (173, 242) to (315, 246).
; PLAN: r0=173(x1), r1=242(y1), r2=315(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 242
LDI r2, 315
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
