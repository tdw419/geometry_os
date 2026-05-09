; DESCRIPTION: Composite: Places a black dot at position (397, 34) then Places a blue line segment connecting (316, 13) to (218, 202).
; PLAN: r0=397(x), r1=34(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=316(x1), r6=13(y1), r7=218(x2), r8=202(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 397
LDI r1, 34
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 316
LDI r6, 13
LDI r7, 218
LDI r8, 202
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
