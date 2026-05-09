; DESCRIPTION: Places a red line segment connecting (127, 194) to (229, 188).
; PLAN: r0=127(x1), r1=194(y1), r2=229(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 194
LDI r2, 229
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
