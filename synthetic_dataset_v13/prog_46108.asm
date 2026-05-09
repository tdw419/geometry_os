; DESCRIPTION: Places a red line segment connecting (408, 153) to (219, 171).
; PLAN: r0=408(x1), r1=153(y1), r2=219(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 153
LDI r2, 219
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
