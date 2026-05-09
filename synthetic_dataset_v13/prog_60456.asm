; DESCRIPTION: Places a red line segment connecting (212, 44) to (175, 143).
; PLAN: r0=212(x1), r1=44(y1), r2=175(x2), r3=143(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 44
LDI r2, 175
LDI r3, 143
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
