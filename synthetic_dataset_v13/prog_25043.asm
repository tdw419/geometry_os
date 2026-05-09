; DESCRIPTION: Composite: Places a cyan line segment connecting (356, 239) to (348, 43) then Places a orange dot at position (88, 119).
; PLAN: r0=356(x1), r1=239(y1), r2=348(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=88(x), r6=119(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 356
LDI r1, 239
LDI r2, 348
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 119
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
