; DESCRIPTION: Composite: Renders a orange box of size 80x61 starting at (389, 88) then Sets a single green pixel at (325, 104).
; PLAN: r0=389(x), r1=88(y), r2=80(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=325(x), r6=104(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 389
LDI r1, 88
LDI r2, 80
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 104
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
