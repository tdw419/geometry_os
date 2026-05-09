; DESCRIPTION: Composite: Places a green line segment connecting (3, 143) to (331, 17) then Places a cyan circle of radius 72 at center (399, 163).
; PLAN: r0=3(x1), r1=143(y1), r2=331(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=399(x), r6=163(y), r7=72(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 3
LDI r1, 143
LDI r2, 331
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 163
LDI r7, 72
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
