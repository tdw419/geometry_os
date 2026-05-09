; DESCRIPTION: Composite: Draws a cyan circle centered at (288, 175) with radius 69 then Sets a single cyan pixel at (386, 40).
; PLAN: r0=288(x), r1=175(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=386(x), r6=40(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 288
LDI r1, 175
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 386
LDI r6, 40
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
