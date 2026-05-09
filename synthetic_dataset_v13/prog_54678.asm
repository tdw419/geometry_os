; DESCRIPTION: Places a red line segment connecting (181, 27) to (415, 67).
; PLAN: r0=181(x1), r1=27(y1), r2=415(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 27
LDI r2, 415
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
