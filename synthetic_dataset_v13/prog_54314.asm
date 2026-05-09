; DESCRIPTION: Composite: Renders a orange box of size 80x33 starting at (379, 110) then Sets a single orange pixel at (437, 181).
; PLAN: r0=379(x), r1=110(y), r2=80(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=437(x), r6=181(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 379
LDI r1, 110
LDI r2, 80
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 181
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
