; DESCRIPTION: Places a black line segment connecting (141, 103) to (432, 113).
; PLAN: r0=141(x1), r1=103(y1), r2=432(x2), r3=113(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 103
LDI r2, 432
LDI r3, 113
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
