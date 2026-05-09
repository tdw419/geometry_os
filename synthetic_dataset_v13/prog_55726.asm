; DESCRIPTION: Places a red line segment connecting (286, 255) to (460, 69).
; PLAN: r0=286(x1), r1=255(y1), r2=460(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 255
LDI r2, 460
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
