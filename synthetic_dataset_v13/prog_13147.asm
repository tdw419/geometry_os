; DESCRIPTION: Places a red line segment connecting (91, 238) to (173, 199).
; PLAN: r0=91(x1), r1=238(y1), r2=173(x2), r3=199(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 238
LDI r2, 173
LDI r3, 199
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
