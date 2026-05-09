; DESCRIPTION: Composite: Sets a single green pixel at (200, 161) then Draws a orange circle centered at (306, 96) with radius 20.
; PLAN: r0=200(x), r1=161(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=306(x), r6=96(y), r7=20(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 200
LDI r1, 161
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 306
LDI r6, 96
LDI r7, 20
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
