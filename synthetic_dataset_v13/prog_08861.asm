; DESCRIPTION: Places a black line segment connecting (85, 42) to (285, 190).
; PLAN: r0=85(x1), r1=42(y1), r2=285(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 42
LDI r2, 285
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
