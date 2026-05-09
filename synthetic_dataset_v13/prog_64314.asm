; DESCRIPTION: Composite: Sets a single green pixel at (198, 131) then Draws a orange circle centered at (393, 180) with radius 24.
; PLAN: r0=198(x), r1=131(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=393(x), r6=180(y), r7=24(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 198
LDI r1, 131
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 393
LDI r6, 180
LDI r7, 24
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
