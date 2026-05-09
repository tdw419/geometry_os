; DESCRIPTION: Composite: Places a black dot at position (352, 111) then Draws a green circle centered at (96, 113) with radius 21.
; PLAN: r0=352(x), r1=111(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=96(x), r6=113(y), r7=21(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 352
LDI r1, 111
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 96
LDI r6, 113
LDI r7, 21
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
