; DESCRIPTION: Places a black line segment connecting (113, 9) to (354, 241).
; PLAN: r0=113(x1), r1=9(y1), r2=354(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 9
LDI r2, 354
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
