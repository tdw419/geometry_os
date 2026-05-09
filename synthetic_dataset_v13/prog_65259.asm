; DESCRIPTION: Places a red line segment connecting (290, 200) to (362, 36).
; PLAN: r0=290(x1), r1=200(y1), r2=362(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 200
LDI r2, 362
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
