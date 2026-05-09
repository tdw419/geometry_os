; DESCRIPTION: Composite: Places a green line segment connecting (53, 26) to (458, 215) then Places a cyan circle of radius 78 at center (348, 120).
; PLAN: r0=53(x1), r1=26(y1), r2=458(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=348(x), r6=120(y), r7=78(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 53
LDI r1, 26
LDI r2, 458
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 120
LDI r7, 78
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
