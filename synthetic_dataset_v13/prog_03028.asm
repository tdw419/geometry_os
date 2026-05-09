; DESCRIPTION: Places a red line segment connecting (113, 62) to (164, 53).
; PLAN: r0=113(x1), r1=62(y1), r2=164(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 62
LDI r2, 164
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
