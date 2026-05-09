; DESCRIPTION: Places a purple line segment connecting (380, 64) to (499, 12).
; PLAN: r0=380(x1), r1=64(y1), r2=499(x2), r3=12(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 64
LDI r2, 499
LDI r3, 12
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
