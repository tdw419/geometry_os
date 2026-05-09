; DESCRIPTION: Draws a white line from (496, 220) to (474, 163).
; PLAN: r0=496(x1), r1=220(y1), r2=474(x2), r3=163(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 220
LDI r2, 474
LDI r3, 163
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
