; DESCRIPTION: Composite: Places a orange circle of radius 28 at center (391, 126) then Places a red line segment connecting (394, 29) to (492, 128).
; PLAN: r0=391(x), r1=126(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=394(x1), r6=29(y1), r7=492(x2), r8=128(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 391
LDI r1, 126
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 394
LDI r6, 29
LDI r7, 492
LDI r8, 128
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
