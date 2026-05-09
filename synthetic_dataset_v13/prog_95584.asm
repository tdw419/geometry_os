; DESCRIPTION: Places a red line segment connecting (438, 57) to (465, 165).
; PLAN: r0=438(x1), r1=57(y1), r2=465(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 57
LDI r2, 465
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
