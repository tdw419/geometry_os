; DESCRIPTION: Composite: Draws a red circle centered at (286, 113) with radius 47 then Places a cyan dot at position (500, 84).
; PLAN: r0=286(x), r1=113(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=500(x), r6=84(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 286
LDI r1, 113
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 500
LDI r6, 84
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
