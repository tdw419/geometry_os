; DESCRIPTION: Places a blue line segment connecting (179, 221) to (460, 159).
; PLAN: r0=179(x1), r1=221(y1), r2=460(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 221
LDI r2, 460
LDI r3, 159
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
