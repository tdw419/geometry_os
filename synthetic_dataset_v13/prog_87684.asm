; DESCRIPTION: Composite: Places a orange line segment connecting (285, 30) to (445, 63) then Places a cyan circle of radius 73 at center (414, 120).
; PLAN: r0=285(x1), r1=30(y1), r2=445(x2), r3=63(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=414(x), r6=120(y), r7=73(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 285
LDI r1, 30
LDI r2, 445
LDI r3, 63
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 120
LDI r7, 73
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
