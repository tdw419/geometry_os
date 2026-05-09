; DESCRIPTION: Places a red line segment connecting (72, 221) to (421, 115).
; PLAN: r0=72(x1), r1=221(y1), r2=421(x2), r3=115(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 221
LDI r2, 421
LDI r3, 115
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
