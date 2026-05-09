; DESCRIPTION: Composite: Places a cyan line segment connecting (405, 165) to (10, 31) then Places a black circle of radius 56 at center (178, 163).
; PLAN: r0=405(x1), r1=165(y1), r2=10(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=178(x), r6=163(y), r7=56(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 405
LDI r1, 165
LDI r2, 10
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 163
LDI r7, 56
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
