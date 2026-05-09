; DESCRIPTION: Places a orange line segment connecting (460, 221) to (238, 185).
; PLAN: r0=460(x1), r1=221(y1), r2=238(x2), r3=185(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 221
LDI r2, 238
LDI r3, 185
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
