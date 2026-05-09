; DESCRIPTION: Places a black line segment connecting (113, 194) to (104, 113).
; PLAN: r0=113(x1), r1=194(y1), r2=104(x2), r3=113(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 194
LDI r2, 104
LDI r3, 113
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
