; DESCRIPTION: Places a red line segment connecting (334, 255) to (174, 196).
; PLAN: r0=334(x1), r1=255(y1), r2=174(x2), r3=196(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 255
LDI r2, 174
LDI r3, 196
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
