; DESCRIPTION: Places a white line segment connecting (475, 173) to (131, 7).
; PLAN: r0=475(x1), r1=173(y1), r2=131(x2), r3=7(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 173
LDI r2, 131
LDI r3, 7
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
