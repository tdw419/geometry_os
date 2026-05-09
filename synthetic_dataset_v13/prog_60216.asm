; DESCRIPTION: Places a red line segment connecting (460, 79) to (117, 8).
; PLAN: r0=460(x1), r1=79(y1), r2=117(x2), r3=8(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 79
LDI r2, 117
LDI r3, 8
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
