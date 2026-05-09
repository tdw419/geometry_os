; DESCRIPTION: Composite: Sets a single yellow pixel at (42, 91) then Draws a red circle centered at (300, 172) with radius 66.
; PLAN: r0=42(x), r1=91(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=300(x), r6=172(y), r7=66(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 42
LDI r1, 91
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 300
LDI r6, 172
LDI r7, 66
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
