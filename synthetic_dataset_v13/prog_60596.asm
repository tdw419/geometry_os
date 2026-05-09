; DESCRIPTION: Places a red line segment connecting (465, 69) to (483, 255).
; PLAN: r0=465(x1), r1=69(y1), r2=483(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 69
LDI r2, 483
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
