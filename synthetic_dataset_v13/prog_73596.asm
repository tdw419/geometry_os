; DESCRIPTION: Places a red line segment connecting (261, 177) to (90, 60).
; PLAN: r0=261(x1), r1=177(y1), r2=90(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 177
LDI r2, 90
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
