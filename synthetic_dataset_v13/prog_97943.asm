; DESCRIPTION: Composite: Draws a red circle centered at (281, 101) with radius 74 then Sets a single cyan pixel at (85, 225).
; PLAN: r0=281(x), r1=101(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x), r6=225(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 281
LDI r1, 101
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 225
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
