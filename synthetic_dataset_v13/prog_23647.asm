; DESCRIPTION: Places a black line segment connecting (460, 21) to (59, 207).
; PLAN: r0=460(x1), r1=21(y1), r2=59(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 21
LDI r2, 59
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
