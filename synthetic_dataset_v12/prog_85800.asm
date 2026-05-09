; DESCRIPTION: Places a red line segment connecting (492, 212) to (362, 175).
; PLAN: r0=492(x1), r1=212(y1), r2=362(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 212
LDI r2, 362
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
