; DESCRIPTION: Composite: Places a purple line segment connecting (178, 68) to (229, 79) then Sets a single white pixel at (256, 168).
; PLAN: r0=178(x1), r1=68(y1), r2=229(x2), r3=79(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=256(x), r6=168(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 178
LDI r1, 68
LDI r2, 229
LDI r3, 79
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 168
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
