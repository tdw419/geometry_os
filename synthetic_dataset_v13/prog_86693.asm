; DESCRIPTION: Composite: Places a white line segment connecting (16, 81) to (356, 67) then Sets a single black pixel at (334, 182).
; PLAN: r0=16(x1), r1=81(y1), r2=356(x2), r3=67(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=334(x), r6=182(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 16
LDI r1, 81
LDI r2, 356
LDI r3, 67
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 334
LDI r6, 182
LDI r7, 0x000000
PSET r5, r6, r7
HALT
