; DESCRIPTION: Composite: Places a green line segment connecting (348, 5) to (464, 234) then Places a black dot at position (482, 72).
; PLAN: r0=348(x1), r1=5(y1), r2=464(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=482(x), r6=72(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 348
LDI r1, 5
LDI r2, 464
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 482
LDI r6, 72
LDI r7, 0x000000
PSET r5, r6, r7
HALT
