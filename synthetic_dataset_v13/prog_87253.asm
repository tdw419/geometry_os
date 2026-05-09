; DESCRIPTION: Composite: Places a purple dot at position (240, 129) then Draws a white circle centered at (170, 166) with radius 77.
; PLAN: r0=240(x), r1=129(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=170(x), r6=166(y), r7=77(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 240
LDI r1, 129
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 170
LDI r6, 166
LDI r7, 77
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
