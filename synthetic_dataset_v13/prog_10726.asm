; DESCRIPTION: Places a red line segment connecting (420, 51) to (425, 163).
; PLAN: r0=420(x1), r1=51(y1), r2=425(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 51
LDI r2, 425
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
