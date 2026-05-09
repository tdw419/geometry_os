; DESCRIPTION: Places a red line segment connecting (387, 60) to (499, 190).
; PLAN: r0=387(x1), r1=60(y1), r2=499(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 60
LDI r2, 499
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
