; DESCRIPTION: Places a red line segment connecting (255, 185) to (98, 75).
; PLAN: r0=255(x1), r1=185(y1), r2=98(x2), r3=75(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 185
LDI r2, 98
LDI r3, 75
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
