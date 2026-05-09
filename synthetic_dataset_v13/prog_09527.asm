; DESCRIPTION: Places a white line segment connecting (460, 246) to (43, 238).
; PLAN: r0=460(x1), r1=246(y1), r2=43(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 246
LDI r2, 43
LDI r3, 238
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
