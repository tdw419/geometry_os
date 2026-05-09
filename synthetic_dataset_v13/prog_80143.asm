; DESCRIPTION: Places a red line segment connecting (425, 187) to (425, 36).
; PLAN: r0=425(x1), r1=187(y1), r2=425(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 187
LDI r2, 425
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
