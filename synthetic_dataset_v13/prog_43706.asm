; DESCRIPTION: Composite: Places a red line segment connecting (219, 143) to (10, 139) then Sets a single white pixel at (218, 255).
; PLAN: r0=219(x1), r1=143(y1), r2=10(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=218(x), r6=255(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 219
LDI r1, 143
LDI r2, 10
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 255
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
