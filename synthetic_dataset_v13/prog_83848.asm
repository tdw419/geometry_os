; DESCRIPTION: Places a black line segment connecting (143, 8) to (499, 190).
; PLAN: r0=143(x1), r1=8(y1), r2=499(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 8
LDI r2, 499
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
