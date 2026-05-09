; DESCRIPTION: Places a red line segment connecting (220, 96) to (71, 60).
; PLAN: r0=220(x1), r1=96(y1), r2=71(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 96
LDI r2, 71
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
