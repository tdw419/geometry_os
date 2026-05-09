; DESCRIPTION: Places a orange line segment connecting (305, 73) to (408, 255).
; PLAN: r0=305(x1), r1=73(y1), r2=408(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 73
LDI r2, 408
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
