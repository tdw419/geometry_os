; DESCRIPTION: Places a green line segment connecting (440, 116) to (143, 190).
; PLAN: r0=440(x1), r1=116(y1), r2=143(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 116
LDI r2, 143
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
