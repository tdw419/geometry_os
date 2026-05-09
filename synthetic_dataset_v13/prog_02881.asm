; DESCRIPTION: Places a red line segment connecting (261, 255) to (116, 27).
; PLAN: r0=261(x1), r1=255(y1), r2=116(x2), r3=27(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 255
LDI r2, 116
LDI r3, 27
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
