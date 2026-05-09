; DESCRIPTION: Places a red line segment connecting (267, 162) to (454, 197).
; PLAN: r0=267(x1), r1=162(y1), r2=454(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 162
LDI r2, 454
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
