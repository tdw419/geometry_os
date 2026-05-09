; DESCRIPTION: Composite: Renders a yellow box of size 110x75 starting at (11, 44) then Sets a single yellow pixel at (284, 184).
; PLAN: r0=11(x), r1=44(y), r2=110(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=284(x), r6=184(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 11
LDI r1, 44
LDI r2, 110
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 184
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
