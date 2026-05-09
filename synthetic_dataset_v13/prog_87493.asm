; DESCRIPTION: Places a red line segment connecting (452, 72) to (319, 171).
; PLAN: r0=452(x1), r1=72(y1), r2=319(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 72
LDI r2, 319
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
