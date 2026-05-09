; DESCRIPTION: Composite: Sets a single green pixel at (196, 193) then Draws a white circle centered at (193, 121) with radius 72.
; PLAN: r0=196(x), r1=193(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=193(x), r6=121(y), r7=72(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 196
LDI r1, 193
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 193
LDI r6, 121
LDI r7, 72
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
